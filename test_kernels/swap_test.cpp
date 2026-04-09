#include <hip/hip_bf16.h>
#include <hip/hip_runtime.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

static constexpr int mma_m = 32; 
static constexpr int mma_n = 32; 
static constexpr int mma_k = 8; 
static constexpr int wavefront_size = 64;
static constexpr int M = 32; 
static constexpr int N = 32; 
static constexpr int K = 16; 




typedef __bf16 bf16_t;
typedef __bf16 bf16x4_t __attribute__((ext_vector_type(4)));
typedef __bf16 bf16x8_t __attribute__((ext_vector_type(8)));
typedef float fp32x4_t __attribute__((ext_vector_type(4)));
typedef float fp32x16_t __attribute__((ext_vector_type(16)));



__device__ __forceinline__
void lane_pair_half_swap(bf16x8_t& a, int lane_id)
{
  int partner = lane_id ^ 1;
  uint32_t is_odd = lane_id & 1;
  uint32_t* w = reinterpret_cast<uint32_t*>(&a);

  uint32_t p_lo0 = __builtin_amdgcn_ds_bpermute(partner * 4, w[0]);
  uint32_t p_lo1 = __builtin_amdgcn_ds_bpermute(partner * 4, w[1]);
  uint32_t p_hi0 = __builtin_amdgcn_ds_bpermute(partner * 4, w[2]);
  uint32_t p_hi1 = __builtin_amdgcn_ds_bpermute(partner * 4, w[3]);

  w[0] = is_odd ? p_hi0 : w[0];
  w[1] = is_odd ? p_hi1 : w[1];
  w[2] = is_odd ? w[2] : p_lo0;
  w[3] = is_odd ? w[3] : p_lo1;
}


__global__ void swap_test(const bf16_t* A, const bf16_t* B, float* C)
{
  bf16x8_t a_reg; 
  bf16x8_t b_reg; 
  fp32x16_t c_reg {};
  int l = threadIdx.x; 

  __shared__ bf16_t As[M*K];
  __shared__ bf16_t Bs[K*N]; 

  int a_load_k =  8*(l%2); 
  int a_load_m =  (l/2); 

  int b_load_k = 8*(l%2); 
  int b_load_n = (l/2); 

  a_reg = *reinterpret_cast< const bf16x8_t*>(A + (a_load_m*K + a_load_k)); 
  b_reg = *reinterpret_cast< const bf16x8_t*>(B + (b_load_n*K + b_load_k));

  
  __syncthreads();
  lane_pair_half_swap(a_reg, l); 
  lane_pair_half_swap(b_reg, l); 
  __syncthreads();
  *reinterpret_cast<bf16x8_t*>(As + (a_load_m*K + a_load_k)) = a_reg; 
  *reinterpret_cast<bf16x8_t*>(Bs + (b_load_n*K + b_load_k)) = b_reg; 
  __syncthreads();

  int a_row = l % 32; 
  int a_col_thread = (l / 32) * 8; 
  
  int b_row_thread = (l / 32) * 8; 
  int b_col = l % 32; 

  a_reg = *reinterpret_cast< const bf16x8_t*>(As + (a_row*K + a_col_thread)); 
  b_reg = *reinterpret_cast< const bf16x8_t*>(Bs + (b_col*K + b_row_thread));



  int c_row_thread = (l / 32) * 4; 
  int c_col = l % 32;
  bf16x4_t a0 = {a_reg[0], a_reg[1], a_reg[2], a_reg[3]};
  bf16x4_t a1 = {a_reg[4], a_reg[5], a_reg[6], a_reg[7]};
  bf16x4_t b0 = {b_reg[0], b_reg[1], b_reg[2], b_reg[3]};
  bf16x4_t b1 = {b_reg[4], b_reg[5], b_reg[6], b_reg[7]};

  // Two k-steps
  c_reg = __builtin_amdgcn_mfma_f32_32x32x8bf16_1k(a0, b0, c_reg, 0, 0, 0);
  c_reg = __builtin_amdgcn_mfma_f32_32x32x8bf16_1k(a1, b1, c_reg, 0, 0, 0);

  fp32x4_t* c_out = reinterpret_cast<fp32x4_t*>(&c_reg);
  
  for (int i = 0; i < 4; i++) {
      *reinterpret_cast<fp32x4_t*>(C + ((c_col * mma_m) + c_row_thread + i * 8)) = c_out[i];
  }


}


int main()
{
  float h_A[M * K];
  float h_B[K * N];
  float h_C[M * N];
  float h_C_ref[M * N];

  srand(42);
  for (int i = 0; i < M * K; i++)
    h_A[i] = (float)(rand() % 5);
  for (int i = 0; i < K * N; i++)
    h_B[i] = (float)(rand() % 5);

  // CPU ref: A is K-major (row-major), B is K-major (col-major for B)
  for (int m = 0; m < M; m++)
  {
    for (int n = 0; n < N; n++)
    {
      float sum = 0.0f;
      for (int k = 0; k < K; k++)
        sum += h_A[m * K + k] * h_B[n * K + k];
      h_C_ref[m + n * M] = sum; // M-major output
    }
  }

  __hip_bfloat16 h_A_bf16[M * K];
  __hip_bfloat16 h_B_bf16[K * N];
  for (int i = 0; i < M * K; i++)
    h_A_bf16[i] = __float2bfloat16(h_A[i]);
  for (int i = 0; i < K * N; i++)
    h_B_bf16[i] = __float2bfloat16(h_B[i]);

  __hip_bfloat16 *d_A, *d_B;
  float *d_C;
  hipMalloc(&d_A, M * K * sizeof(__hip_bfloat16));
  hipMalloc(&d_B, K * N * sizeof(__hip_bfloat16));
  hipMalloc(&d_C, M * N * sizeof(float));
  hipMemset(d_C, 0, M * N * sizeof(float));

  hipMemcpy(d_A, h_A_bf16, M * K * sizeof(__hip_bfloat16), hipMemcpyHostToDevice);
  hipMemcpy(d_B, h_B_bf16, K * N * sizeof(__hip_bfloat16), hipMemcpyHostToDevice);

  hipLaunchKernelGGL(swap_test, dim3(1), dim3(wavefront_size), 0, 0,
    reinterpret_cast<const bf16_t*>(d_A),
    reinterpret_cast<const bf16_t*>(d_B),
    d_C);
  hipDeviceSynchronize();

  hipMemcpy(h_C, d_C, M * N * sizeof(float), hipMemcpyDeviceToHost);

  int errors = 0;
  for (int i = 0; i < M * N; i++)
  {
    if (fabsf(h_C[i] - h_C_ref[i]) > 1e-1f)
    {
      if (errors < 10)
        printf("MISMATCH at [%d]: GPU=%.2f CPU=%.2f\n", i, h_C[i], h_C_ref[i]);
      errors++;
    }
  }

  if (errors == 0)
    printf("PASSED! All %d elements match.\n", M * N);
  else
    printf("FAILED! %d/%d mismatches.\n", errors, M * N);

  hipFree(d_A);
  hipFree(d_B);
  hipFree(d_C);
  return 0;
} 