#include <hip/hip_bf16.h>
#include <hip/hip_runtime.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "../abstractions/gemm_maker.hpp"


static constexpr int M = 8192; 
static constexpr int K = 8192; 
static constexpr int N = 8192; 
static constexpr int mma_m = 16; 
static constexpr int mma_n = 16; 
static constexpr int mma_k = 16; 
static constexpr int wavefront_size = 64;
static constexpr int acc_per_warp_m = 4; 
static constexpr int acc_per_warp_n = 4; 
static constexpr int wpb_m = 4; 
static constexpr int wpb_n = 4; 
static constexpr int WM = mma_m*acc_per_warp_m;  
static constexpr int WN = mma_n*acc_per_warp_n; 
static constexpr int BM = WM*wpb_m; 
static constexpr int BN = WN*wpb_n; 
static constexpr int BK = 32; 
static constexpr int block_size = wpb_m*wpb_n*wavefront_size;
static constexpr int GM = M/BM; 
static constexpr int GN = N/BN; 
static constexpr int grid_size = GM*GN; 
static constexpr int bk_iters = K/BK; 
static constexpr int wk_iters = BK/(2*mma_k); // very important to multiply mma_k by 2
static constexpr int bk_threads = BK/8; 
static constexpr int rest_threads = (block_size/bk_threads);
static constexpr int bm_iters = BM/rest_threads; 
static constexpr int bn_iters = BN/rest_threads;



static_assert((BM * BK / 8) % block_size == 0);
static_assert((BN * BK / 8) % block_size == 0);
static_assert(BK >= 2*mma_k);
using c_elem_t = std::conditional_t<mma_m == 32, fp32x16_t, fp32x4_t>;


__global__ void matmul(bf16_t*A, bf16_t*B, float*C)
{
  int b = blockIdx.x; 
  int t = threadIdx.x; 
  int w = t/wavefront_size;
  int l = t % wavefront_size; 

  int block_start_m = (b%GM)*BM; 
  int block_start_n = (b/GM)*BN; 

  A += block_start_m*K; //A is k-major 
  B += block_start_n*K; // B is also k-major
  C += block_start_m + (block_start_n*M); //C is M major  

  __shared__ bf16_t As[2][BM*BK]; 
  __shared__ bf16_t Bs[2][BK*BN]; 
  bf16x8_t a_reg[acc_per_warp_m]; 
  bf16x8_t b_reg[acc_per_warp_n]; 
  c_elem_t c_reg[acc_per_warp_n][acc_per_warp_m] {};

  gemmMaker<mma_m, mma_n, mma_k,
  acc_per_warp_m, acc_per_warp_n,
  WM, WN, BM, BN, BK,
  M, N, K, block_size>gemm(l, w, t);

  bf16x8_t a_ld_reg[bm_iters]; 
  bf16x8_t b_ld_reg[bn_iters];
  
  gemm.load_A_g2r(A, a_ld_reg, 0);
  gemm.load_B_g2r(B, b_ld_reg, 0);
  gemm.swap_a_reg(a_ld_reg);
  gemm.swap_b_reg(b_ld_reg);
  gemm.store_A_r2s(As[0], a_ld_reg);
  gemm.store_B_r2s(Bs[0], b_ld_reg);

  __syncthreads();

  for (int bk_idx = 0; bk_idx < bk_iters-1; bk_idx++)
  {
    int stage = bk_idx % 2; 
    int nxt_stage = (bk_idx + 1) % 2; 

    gemm.load_A_g2r(A, a_ld_reg, bk_idx+1);
    gemm.load_B_g2r(B, b_ld_reg, bk_idx+1);

    for (int wk_idx = 0; wk_idx < wk_iters; wk_idx++)
    {
      gemm.load_A_s2r(As[stage], a_reg, wk_idx);
      gemm.load_B_s2r(Bs[stage], b_reg, wk_idx); 
      gemm.mfma(c_reg,a_reg,b_reg);
    }

    gemm.swap_a_reg(a_ld_reg);
    gemm.swap_b_reg(b_ld_reg);
    gemm.store_A_r2s(As[nxt_stage], a_ld_reg);
    gemm.store_B_r2s(Bs[nxt_stage], b_ld_reg);
    __syncthreads();
  }

  int bk_idx = bk_iters-1;
  int stage = bk_idx % 2; 
  for (int wk_idx = 0; wk_idx < wk_iters; wk_idx++)
  {
    gemm.load_A_s2r(As[stage], a_reg, wk_idx);
    gemm.load_B_s2r(Bs[stage], b_reg, wk_idx); 
    gemm.mfma(c_reg,a_reg,b_reg);
  }

  __syncthreads();
  gemm.store_C_r2g(C, c_reg);

}

extern "C" void launch_matmul(void* A, void* B, void* C) {
  hipLaunchKernelGGL(matmul, dim3(grid_size), dim3(block_size), 0, 0,
    (bf16_t*)A, (bf16_t*)B, (float*)C);
}