#pragma once
#include <hip/hip_bf16.h>
#include <hip/hip_runtime.h>  
#include <type_traits>

// IMPORTANT NOTE, this abstraction only works for K major A,B and M major C 
// moreover, all global pointers must be offseted to block start, this is not done here so that one can be flexible 
// and do block swizzling to promote L2 reuse and so on. 


typedef __bf16 bf16_t;
typedef __bf16 bf16x4_t __attribute__((ext_vector_type(4)));
typedef __bf16 bf16x8_t __attribute__((ext_vector_type(8)));
typedef float fp32x4_t __attribute__((ext_vector_type(4)));
typedef float fp32x16_t __attribute__((ext_vector_type(16)));

template <int MMA_M, int MMA_N, int MMA_K, int AccM, int AccN, int WM, int WN, int BM, int BN, int BK, int M, int N, int K, int BlockSize>
struct gemmMaker
{
  static_assert(MMA_M == 32 && MMA_N == 32 && MMA_K == 8 ||
                MMA_M == 16 && MMA_N == 16 && MMA_K == 16,
                "Only (32,32,8) and (16,16,16) supported");
  static_assert(BM % MMA_M == 0, "BM must be divisible by MMA_M");
  static_assert(BN % MMA_N == 0, "BN must be divisible by MMA_N");
  static_assert(BK % MMA_K == 0, "BK must be divisible by MMA_K");
  static_assert(BK >= 2 * MMA_K, "BK must be at least 2x MMA_K");
  static_assert((BK & (BK - 1)) == 0, "BK must be power of 2");
  static_assert((BM & (BM - 1)) == 0, "BM must be power of 2");
  static_assert((BN & (BN - 1)) == 0, "BN must be power of 2");
  static_assert(WM == MMA_M * AccM, "WM must equal MMA_M * AccM");
  static_assert(WN == MMA_N * AccN, "WN must equal MMA_N * AccN");
  static_assert(BM % WM == 0, "BM must be divisible by WM");
  static_assert(BN % WN == 0, "BN must be divisible by WN");

  static_assert((BM * BK / 8) % BlockSize == 0);
  static_assert((BN * BK / 8) % BlockSize == 0);
  static constexpr int bk_threads = BK/8; 
  static constexpr int rest_threads = (BlockSize/bk_threads);
  static constexpr int bm_iters = BM/rest_threads; 
  static constexpr int bn_iters = BN/rest_threads;
  static constexpr int b_bits = __builtin_ctz(BK * sizeof(bf16_t)) - 4;
  static constexpr int m_base = 4;
  static constexpr int s_shift = 3;
  static constexpr int SwapXorMask = (MMA_M == 32) ? 1 : 2;
  static constexpr int wk_iters = BK / (2 * MMA_K); //just remember that we do 2 MMA_K per iter at once. 


  using c_elem_t = std::conditional_t<MMA_M == 32, fp32x16_t, fp32x4_t>; 

  int lane_id;
  int warp_id;
  int thread_id;
  int a_g2r_off;
  int b_g2r_off;
  int a_r2s_off;
  int b_r2s_off; 
  int a_s2r_off; 
  int b_s2r_off; 
  int c_r2g_off;

  __device__ SmemLoader(int l, int w, int t) : lane_id(l), warp_id(w), thread_id(t) 

  {
    static constexpr int wpb_n = BN / WN;
    int warp_start_m = (w / wpb_n) * WM; //might change warp -> co-ordinate layout to match c-layouts m_major situation idk
    int warp_start_n = (w % wpb_n) * WN;
    int g2r_k_idx = 8 * (t % bk_threads);
    int g2r_m_n_idx = t / bk_threads;
    a_g2r_off = g2r_m_n_idx * K + g2r_k_idx;
    b_g2r_off = g2r_m_n_idx * K + g2r_k_idx;
    a_r2s_off = g2r_m_n_idx * BK + g2r_k_idx;
    b_r2s_off = g2r_m_n_idx * BK + g2r_k_idx;
    int s2r_k_lane_idx = (l/MMA_M)*8; 
    int s2r_m_n_lane_idx = (l%MMA_M);
    int r2g_m_lane_idx = (l/MMA_M)*4; 
    int r2g_n_lane_idx = (l%MMA_M);

    a_s2r_off = (warp_start_m + s2r_m_n_lane_idx) * BK + (s2r_k_lane_idx);
    b_s2r_off = (warp_start_n + s2r_m_n_lane_idx) * BK + (s2r_k_lane_idx); 

    c_r2g_off = (warp_start_n + r2g_n_lane_idx)*M + (warp_start_m + r2g_m_lane_idx);

  }
  
  __device__ __forceinline__
  void load_A_g2s(const bf16_t* A_global, bf16_t* As, int bk_idx) 
  {
    bf16x8_t a_ld_reg;
    int a_g2r_with_bk_off = a_g2r_off + (bk_idx*BK);
    
    for (int m_it = 0; m_it < bm_iters; m_it++)
    {
      int m_start = m_it*rest_threads; // just cause we might pipe later and need iter idx
      a_ld_reg = *reinterpret_cast<const bf16x8_t*>(A_global + a_g2r_with_bk_off + (m_start*K)); 
      lane_half_swap<SwapXorMask>(a_ld_reg,lane_id);
      uint32_t a_st_off = swizzle<b_bits,m_base,s_shift>((a_r2s_off + (m_start*BK))*sizeof(__bf16));
      *reinterpret_cast<bf16x8_t*>((char*)As + a_st_off) = a_ld_reg;
    }
  }

  __device__ __forceinline__
  void load_B_g2s(const bf16_t* B_global, bf16_t* Bs, int bk_idx) 
  {
    bf16x8_t b_ld_reg; 
    int b_g2r_with_bk_off = b_g2r_off + (bk_idx*BK);
    
    for (int n_it = 0; n_it < bn_iters; n_it++)
    {
      int n_start = n_it*rest_threads; 
      b_ld_reg = *reinterpret_cast<const bf16x8_t*>(B_global + b_g2r_with_bk_off + (n_start*K));
      lane_half_swap<SwapXorMask>(b_ld_reg,lane_id);
      uint32_t b_st_off = swizzle<b_bits,m_base,s_shift>((b_r2s_off + (n_start*BK))*sizeof(__bf16));
      *reinterpret_cast<bf16x8_t*>((char*)Bs + b_st_off) = b_ld_reg;
    }
    
  }

  __device__ __forceinline__
  void store_C_r2g(float* C_global, c_elem_t c_reg[AccN][AccM]) 
  {
    if constexpr (MMA_M == 32)
    {
      for (int n = 0; n < AccN; n++)
      {
        int store_c_r2g_with_n = c_r2g_off + (n*MMA_N*M);
        for (int m = 0; m < AccM; m++)
        {
          int store_off = store_c_r2g_with_n + (m*MMA_M);
          fp32x4_t* c_out = reinterpret_cast<fp32x4_t*>(&(c_reg[n][m]));
          #pragma unroll
          for (int i = 0; i < 4; i++)
          {
            *reinterpret_cast<fp32x4_t*>(C_global + store_off + (i * 8)) = c_out[i];
          }
        }
      }
    }
    else
    {
      for (int n = 0; n < AccN; n++)
      {
        int store_c_r2g_with_n = c_r2g_off + (n*MMA_N*M);
        for (int m = 0; m < AccM; m++)
        {
          int store_off = store_c_r2g_with_n + (m*MMA_M);
          *reinterpret_cast<fp32x4_t*>(C_global + store_off) = c_reg[n][m];
        }
      }
    }
  }


  __device__ __forceinline__ 
  void load_A_s2r(bf16_t*As, bf16x8_t a_reg[AccM], int wk_idx) 
  {
    int a_s2r_with_wk_off = a_s2r_off + (wk_idx*MMA_K*2); 
    for (int m = 0; m < AccM; m++)
    {
      uint32_t as_ld_off = swizzle<b_bits,m_base,s_shift>((a_s2r_with_wk_off + (m*MMA_M*BK))*sizeof(__bf16));
      a_reg[m] = *reinterpret_cast<bf16x8_t*>((char*)As + as_ld_off);
    }
  }

  __device__ __forceinline__ 
  void load_B_s2r(bf16_t*Bs, bf16x8_t b_reg[AccN], int wk_idx) 
  {
    int b_s2r_with_wk_off = b_s2r_off + (wk_idx*MMA_K*2); 
    for (int n = 0; n < AccN; n++)
    {
      uint32_t bs_ld_off = swizzle<b_bits,m_base,s_shift>((b_s2r_with_wk_off + (n*MMA_N*BK))*sizeof(__bf16));
      b_reg[n] = *reinterpret_cast<bf16x8_t*>((char*)Bs + bs_ld_off);
    }
  }

  __device__ __forceinline__
  void mfma(c_elem_t c_reg[AccN][AccM], bf16x8_t a_reg[AccM], bf16x8_t b_reg[AccN]) 
  {
    if constexpr (MMA_M == 32)
    {
      for (int n = 0; n < AccN; n++)
      {
        for (int m = 0; m < AccM; m++)
        {
          bf16x4_t a0 = {a_reg[m][0], a_reg[m][1], a_reg[m][2], a_reg[m][3]};
          bf16x4_t a1 = {a_reg[m][4], a_reg[m][5], a_reg[m][6], a_reg[m][7]};
          bf16x4_t b0 = {b_reg[n][0], b_reg[n][1], b_reg[n][2], b_reg[n][3]};
          bf16x4_t b1 = {b_reg[n][4], b_reg[n][5], b_reg[n][6], b_reg[n][7]};

          // Two k-steps
          c_reg[n][m] = __builtin_amdgcn_mfma_f32_32x32x8bf16_1k(a0, b0, c_reg[n][m], 0, 0, 0);
          c_reg[n][m] = __builtin_amdgcn_mfma_f32_32x32x8bf16_1k(a1, b1, c_reg[n][m], 0, 0, 0);
        }
      }
    }
    else
    {
      for (int n = 0; n < AccN; n++)
      {
        for (int m = 0; m < AccM; m++)
        {
          bf16x4_t a0 = {a_reg[m][0], a_reg[m][1], a_reg[m][2], a_reg[m][3]};
          bf16x4_t a1 = {a_reg[m][4], a_reg[m][5], a_reg[m][6], a_reg[m][7]};
          bf16x4_t b0 = {b_reg[n][0], b_reg[n][1], b_reg[n][2], b_reg[n][3]};
          bf16x4_t b1 = {b_reg[n][4], b_reg[n][5], b_reg[n][6], b_reg[n][7]};

          // Two k-steps
          c_reg[n][m] = __builtin_amdgcn_mfma_f32_16x16x16bf16_1k(a0, b0, c_reg[n][m], 0, 0, 0);
          c_reg[n][m] = __builtin_amdgcn_mfma_f32_16x16x16bf16_1k(a1, b1, c_reg[n][m], 0, 0, 0);
        }
      }
    }
  }



  template <int XorMask>
  __device__ __forceinline__
  void lane_half_swap(bf16x8_t& a, int lane_id)
  {
    static_assert(XorMask == 1 || XorMask == 2, "Only 1 or 2 supported");
    int partner = lane_id ^ XorMask;
    uint32_t use_partner = (lane_id >> (XorMask - 1)) & 1;
    uint32_t* w = reinterpret_cast<uint32_t*>(&a);

    uint32_t p_lo0 = __builtin_amdgcn_ds_bpermute(partner * 4, w[0]);
    uint32_t p_lo1 = __builtin_amdgcn_ds_bpermute(partner * 4, w[1]);
    uint32_t p_hi0 = __builtin_amdgcn_ds_bpermute(partner * 4, w[2]);
    uint32_t p_hi1 = __builtin_amdgcn_ds_bpermute(partner * 4, w[3]);

    w[0] = use_partner ? p_hi0 : w[0];
    w[1] = use_partner ? p_hi1 : w[1];
    w[2] = use_partner ? w[2] : p_lo0;
    w[3] = use_partner ? w[3] : p_lo1;
  }


  template <int BBits, int MBase, int SShift>
  __device__ __forceinline__
  uint32_t swizzle(uint32_t byte_off) 
  {
    static_assert(SShift >= BBits, "SShift must be >= BBits");
    constexpr uint32_t mask = ((1u << BBits) - 1u) << (MBase + SShift);
    return byte_off ^ ((byte_off & mask) >> SShift);
  }


};