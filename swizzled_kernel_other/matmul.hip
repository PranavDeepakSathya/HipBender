#include <hip/hip_bf16.h>
#include <hip/hip_runtime.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>


static constexpr int M = 8192; 
static constexpr int K = 8192; 
static constexpr int N = 8192; 
static constexpr int mma_m = 32; 
static constexpr int mma_n = 32; 
static constexpr int mma_k = 8; 
static constexpr int wavefront_size = 64;
static constexpr int acc_per_warp_m = 2; 
static constexpr int acc_per_warp_n = 2; 
static constexpr int wpb_m = 2; 
static constexpr int wpb_n = 2; 
static constexpr int WM = mma_m*acc_per_warp_m;  
static constexpr int WN = mma_n*acc_per_warp_n;
static constexpr int BM = WM*wpb_m; 
static constexpr int BN = WN*wpb_n; 
static constexpr int BK = 16; 
static constexpr int block_size = wpb_m*wpb_n*wavefront_size;
static constexpr int GM = M/BM; 
static constexpr int GN = N/BN; 
static constexpr int grid_size = GM*GN; 
static constexpr int bk_threads = BK/8; 
static constexpr int rest_threads = (block_size)/bk_threads; 
static constexpr int BM_load_iters = BM/rest_threads; 
static constexpr int BN_load_iters = BN/rest_threads;

static constexpr uint32_t b_bits = __builtin_ctz(BK * sizeof(__bf16)) - 4;
static constexpr uint32_t m_base = 4;
static constexpr uint32_t s_shift = 3;

static_assert((BM * BK / 8) % block_size == 0);
static_assert((BN * BK / 8) % block_size == 0);

typedef __bf16 bf16_t;
typedef __bf16 bf16x4_t __attribute__((ext_vector_type(4)));
typedef float fp32x4_t __attribute__((ext_vector_type(4)));
typedef float fp32x16_t __attribute__((ext_vector_type(16)));
typedef __bf16 bf16x8_t __attribute__((ext_vector_type(8)));

template <int BBits, int MBase, int SShift>
__device__ __forceinline__
uint32_t swizzle(uint32_t byte_off) {
  static_assert(SShift >= BBits, "SShift must be >= BBits");
  constexpr uint32_t mask = ((1u << BBits) - 1u) << (MBase + SShift);
  return byte_off ^ ((byte_off & mask) >> SShift);
}


__global__ void matmul(bf16_t*A, bf16_t*B, float*C)
{
  int b = blockIdx.x; 
  int t = threadIdx.x; 
  int w = t/wavefront_size;
  int l = t % wavefront_size; 

  int block_start_m = (b/GN)*BM; 
  int block_start_n = (b%GN)*BN; 
  int warp_start_m = (w/wpb_n)*WM; 
  int warp_start_n = (w%wpb_n)*WN; 
  //even though C is M major instead of the usual N major 
  //its okay to scatter warps as if they were N major cause 
  //coalescing happens inside a particular warp

  A += block_start_m*K; //A is k-major 
  B += block_start_n*K; // B is also k-major
  C += block_start_m + (block_start_n*M); //C is M major  

  __shared__ bf16_t As[BM*BK]; 
  __shared__ bf16_t Bs[BK*BN]; 
  bf16x4_t a_reg[acc_per_warp_m]; 
  bf16x4_t b_reg[acc_per_warp_n]; 
  fp32x16_t c_reg[acc_per_warp_n][acc_per_warp_m] {};

  int inner_k_idx = 8*(t % bk_threads);
  int inner_m_n_idx = (t/bk_threads); 

  int a_lane_row = l % 32; 
  int a_lane_col = (l / 32) * 4; 
  int b_lane_row = (l / 32) * 4; 
  int b_lane_col = l % 32; 
  int c_lane_row = (l / 32) * 4; 
  int c_lane_col = l % 32;


  for (int bk = 0; bk < K; bk+=BK)
  {
    for (int m_start = 0; m_start < BM; m_start += rest_threads)
    {
      uint32_t As_off = swizzle<b_bits,m_base,s_shift>(((m_start + inner_m_n_idx)*BK + inner_k_idx)*sizeof(__bf16));
      *reinterpret_cast<bf16x8_t*>((char*)As + As_off)
      = *reinterpret_cast<bf16x8_t*>(&A[(m_start + inner_m_n_idx)*K + inner_k_idx]);
    }
    for (int n_start = 0; n_start < BN; n_start += rest_threads)
    {
      uint32_t Bs_off = swizzle<b_bits,m_base,s_shift>(((n_start + inner_m_n_idx)*BK + inner_k_idx)*sizeof(__bf16));
      *reinterpret_cast<bf16x8_t*>((char*)Bs + Bs_off)
      = *reinterpret_cast<bf16x8_t*>(&B[(n_start + inner_m_n_idx)*K + inner_k_idx]);
    }
    __syncthreads();

    for (int k = 0; k < BK/mma_k; k++)
    {
      for (int m = 0; m < acc_per_warp_m; m++)
      {
        int a_row = warp_start_m + m*mma_m + a_lane_row; 
        int a_col = k*mma_k + a_lane_col; 
        uint32_t As_off = swizzle<b_bits,m_base,s_shift>((a_row*BK + a_col)*sizeof(__bf16));
        a_reg[m] = *reinterpret_cast<const bf16x4_t*>((char*)As + As_off);
      }

      for (int n = 0; n < acc_per_warp_n; n++)
      {
        int b_row = k*mma_k + b_lane_row; 
        int b_col = warp_start_n + n*mma_n + b_lane_col; 
        uint32_t Bs_off = swizzle<b_bits,m_base,s_shift>((b_col*BK + b_row)*sizeof(__bf16));
        b_reg[n] = *reinterpret_cast<const bf16x4_t*>((char*)Bs + Bs_off);
      }

      for (int m = 0; m < acc_per_warp_m; m++)
      {
        for (int n = 0; n < acc_per_warp_n; n++)
        {
          c_reg[n][m] = __builtin_amdgcn_mfma_f32_32x32x8bf16_1k(a_reg[m], b_reg[n], c_reg[n][m], 0, 0, 0);
        }
      }

    }
    A += BK; 
    B += BK;
    __syncthreads(); // need this before next iteration overwrites LDS
  }
  __syncthreads(); 
  for (int m = 0; m < acc_per_warp_m; m++)
  {
    for (int n = 0; n < acc_per_warp_n; n++)
    {
      int c_row = warp_start_m + m*mma_m + c_lane_row;
      int c_col = warp_start_n + n*mma_n + c_lane_col;
      fp32x4_t* c_out = reinterpret_cast<fp32x4_t*>(&c_reg[n][m]);
      for (int i = 0; i < 4; i++)
      {
        *reinterpret_cast<fp32x4_t*>(C + (c_col*M + c_row + i*8)) = c_out[i];
      }
    }
  }

}

extern "C" void launch_matmul(void* A, void* B, void* C) {
  hipLaunchKernelGGL(matmul, dim3(grid_size), dim3(block_size), 0, 0,
    (bf16_t*)A, (bf16_t*)B, (float*)C);
}