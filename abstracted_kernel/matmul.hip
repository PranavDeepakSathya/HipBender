#include <hip/hip_bf16.h>
#include <hip/hip_runtime.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "../abstractions/gemm_maker.hpp"


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
static constexpr int BK = 32; 
static constexpr int block_size = wpb_m*wpb_n*wavefront_size;
static constexpr int GM = M/BM; 
static constexpr int GN = N/BN; 
static constexpr int grid_size = GM*GN; 
static constexpr int bk_iters = K/BK; 
static constexpr int wk_iters = BK/(2*mma_k); // very important to multiply mma_k by 2

static_assert((BM * BK / 8) % block_size == 0);
static_assert((BN * BK / 8) % block_size == 0);
static_assert(BK >= 2*mma_k);


__global__ void matmul(bf16_t*A, bf16_t*B, float*C)
{
  int b = blockIdx.x; 
  int t = threadIdx.x; 
  int w = t/wavefront_size;
  int l = t % wavefront_size; 

  int block_start_m = (b/GN)*BM; 
  int block_start_n = (b%GN)*BN; 

  A += block_start_m*K; //A is k-major 
  B += block_start_n*K; // B is also k-major
  C += block_start_m + (block_start_n*M); //C is M major  

  __shared__ bf16_t As[BM*BK]; 
  __shared__ bf16_t Bs[BK*BN]; 
  bf16x8_t a_ld_reg; 
  bf16x8_t b_ld_reg;
  bf16x8_t a_reg[acc_per_warp_m]; 
  bf16x8_t b_reg[acc_per_warp_n]; 
  fp32x16_t c_reg[acc_per_warp_n][acc_per_warp_m] {};

  gemmMaker<mma_m, mma_n, mma_k,
  acc_per_warp_m, acc_per_warp_n,
  WM, WN, BM, BN, BK,
  M, N, K, block_size>gemm(l, w, t);

  for (int bk_idx = 0; bk_idx < bk_iters; bk_idx++)
  {
    gemm.load_A_g2s(A, As, a_ld_reg, bk_idx);
    gemm.load_B_g2s(B, Bs, b_ld_reg, bk_idx);
    __syncthreads();
    for (int wk_idx = 0; wk_idx < wk_iters; wk_idx++)
    {
      gemm.load_A_s2r(As, a_reg, wk_idx);
      gemm.load_B_s2r(Bs, b_reg, wk_idx); 
      gemm.mfma(c_reg,a_reg,b_reg);
    }
  }
  __syncthreads();
  gemm.store_C_r2g(C, c_reg);

}

extern "C" void launch_matmul(void* A, void* B, void* C) {
  hipLaunchKernelGGL(matmul, dim3(grid_size), dim3(block_size), 0, 0,
    (bf16_t*)A, (bf16_t*)B, (float*)C);
}