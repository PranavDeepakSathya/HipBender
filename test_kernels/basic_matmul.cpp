#include <hip/hip_bf16.h>
#include <hip/hip_runtime.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

static constexpr int M = 4096; 
static constexpr int K = 4096; 
static constexpr int N = 4096; 
static constexpr int mma_m = 16; 
static constexpr int mma_n = 16; 
static constexpr int mma_k = 16; 
static constexpr int wavefront_size = 64;
static constexpr int acc_per_warp_m = 2; 
static constexpr int acc_per_warp_n = 2; 
static constexpr int wpb_m = 2; 
static constexpr int wpb_n = 2; 
static constexpr int WM = mma_m*wpb_m; 
static constexpr int WN = mma_n*wpb_n; 
static constexpr int BM = WM*wpb_m; 
static constexpr int BN = WN*wpb_n; 
static constexpr int BK = 64; 
static constexpr int block_size = wpb_m*wpb_n;
static constexpr int GM = M/BM; 
static constexpr int GN = N/BN; 
static constexpr int grid_size = GM*GN; 


typedef __bf16 bf16_t;
typedef __bf16 bf16x4_t __attribute__((ext_vector_type(4)));
typedef float fp32x4_t __attribute__((ext_vector_type(4)));

__global__ void matmul(bf16_t*A, bf16_t*B, float*C)
{
  int b = blockIdx.x; 
  int t = threadIdx.x; 
  int w = t/wavefront_size;
  int l = t % wavefront_size; 

  int block_start_m = (b/GN)*BM; 
  int block_start_n = (b%GN)*BN; 

  A += block_start_m*K //A is k-major 
  B += block_start_n*K // B is also k-major
  C += block_start_m + (block_start_n*M) //C is M major  

  __shared__ As[BM*BK]; 
  __shared__ Bs[BK*BN]; 
  bf16x4_t a_reg[acc_per_warp_m]; 
  bf16x4_t b_reg[acc_per_warp_n]; 
  fp32x4_t c_reg[acc_per_warp_m*acc_per_warp_n] {};

  for (int bk = 0; bk < K; bk+=BK)
  {
    



    A += BK; 
    B += BK; 

  }
}