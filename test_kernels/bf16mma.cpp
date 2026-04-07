#include <hip/hip_bf16.h>
#include <hip/hip_runtime.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

static constexpr int mma_m = 16; 
static constexpr int mma_n = 16; 
static constexpr int mma_k = 16; 
static constexpr int wavefront_size = 64;
//this one tv layouts are as follows: 
//A: looks like A column vector of 16 threads, each thread loads a value fragment of a row vector of size 4. 
//B looks like a row of 16 threads, each thread loads a column vector of size 4. 
//C looks like B 

//therefore, for most vectorization possible, we will have A: K major, B: K major, C: M major 
//ddont worry, I write my co-ordinate calcs and then coordinate -> address (via layout) as seperate things
//so its all good, I am the TV LAYOUT MASTER I write (threadxvalue)->(tile_coord) seperately 
// then tile_coord -> layout (via stride can be done)

typedef __bf16 bf16_t;
typedef __bf16 bf16x4_t __attribute__((ext_vector_type(4)));
typedef float fp32x4_t __attribute__((ext_vector_type(4)));


__global__ void matmul(const bf16_t* A, const bf16_t* B, float* C)
{
  bf16x4_t a_reg; 
  bf16x4_t b_reg; 
  fp32x4_t c_reg {};
  int l = threadIdx.x; 

  int a_row = l % 16; 
  int a_col_thread = (l / 16) * 4; 
  
  int b_row_thread = (l / 16) * 4; 
  int b_col = l % 16; 
  
  int c_row_thread = (l / 16) * 4; 
  int c_col = l % 16; 

  //now, depending on the underlying layout, we may either need to write a loop 
  // for filling out the gap of the thread layout, cause the gap dimension is not contigous
  //but here we are deliberately being slick and choosing layouts so that each gap dimension is major 

  a_reg = *reinterpret_cast<const bf16x4_t*>(A + (a_row * mma_k + a_col_thread));
  b_reg = *reinterpret_cast<const bf16x4_t*>(B + (b_col * mma_k + b_row_thread));
  c_reg = __builtin_amdgcn_mfma_f32_16x16x16bf16_1k(a_reg, b_reg, c_reg, 0, 0, 0);
  *reinterpret_cast<fp32x4_t*>(C + (c_col*mma_m + c_row_thread)) = c_reg;
}

int main()
{
  float h_A[mma_m * mma_k];
  float h_B[mma_k * mma_n];
  float h_C[mma_m * mma_n];
  float h_C_ref[mma_m * mma_n];

  srand(42);
  for (int i = 0; i < mma_m * mma_k; i++)
    h_A[i] = (float)(rand() % 5);
  for (int i = 0; i < mma_k * mma_n; i++)
    h_B[i] = (float)(rand() % 5);

  // CPU reference: A is (16x16) K-major (row-major), B is (16x16) K-major (col-major for this layout)
  // A[m,k] = A[m * K + k], B[k,n] = B[k * N + n]
  for (int m = 0; m < mma_m; m++) {
    for (int n = 0; n < mma_n; n++) {
      float sum = 0.0f;
      for (int k = 0; k < mma_k; k++) {
        sum += h_A[m * mma_k + k] * h_B[k + n*mma_k];
      }
      h_C_ref[m + n*mma_m] = sum;
    }
  }

  // Convert to bf16 for device
  __hip_bfloat16 h_A_bf16[mma_m * mma_k];
  __hip_bfloat16 h_B_bf16[mma_k * mma_n];
  for (int i = 0; i < mma_m * mma_k; i++)
    h_A_bf16[i] = __float2bfloat16(h_A[i]);
  for (int i = 0; i < mma_k * mma_n; i++)
    h_B_bf16[i] = __float2bfloat16(h_B[i]);

  __hip_bfloat16 *d_A, *d_B;
  float *d_C;
  hipMalloc(&d_A, mma_m * mma_k * sizeof(__hip_bfloat16));
  hipMalloc(&d_B, mma_k * mma_n * sizeof(__hip_bfloat16));
  hipMalloc(&d_C, mma_m * mma_n * sizeof(float));
  hipMemset(d_C, 0, mma_m * mma_n * sizeof(float));

  hipMemcpy(d_A, h_A_bf16, mma_m * mma_k * sizeof(__hip_bfloat16), hipMemcpyHostToDevice);
  hipMemcpy(d_B, h_B_bf16, mma_k * mma_n * sizeof(__hip_bfloat16), hipMemcpyHostToDevice);

  hipLaunchKernelGGL(matmul, dim3(1), dim3(wavefront_size), 0, 0,
    reinterpret_cast<const bf16_t*>(d_A),
    reinterpret_cast<const bf16_t*>(d_B),
    d_C);
  hipDeviceSynchronize();

  hipMemcpy(h_C, d_C, mma_m * mma_n * sizeof(float), hipMemcpyDeviceToHost);

  int errors = 0;
  for (int i = 0; i < mma_m * mma_n; i++) {
    if (fabsf(h_C[i] - h_C_ref[i]) > 1e-1f) {  // bf16 has lower precision
      if (errors < 10)
        printf("MISMATCH at [%d,%d]: GPU=%.2f CPU=%.2f\n",
              i / mma_n, i % mma_n, h_C[i], h_C_ref[i]);
      errors++;
    }
  }

  if (errors == 0)
    printf("PASSED! All %d elements match.\n", mma_m * mma_n);
  else
    printf("FAILED! %d/%d mismatches.\n", errors, mma_m * mma_n);

  hipFree(d_A);
  hipFree(d_B);
  hipFree(d_C);
  return 0;
}