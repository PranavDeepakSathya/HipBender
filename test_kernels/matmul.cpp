#include <hip/hip_runtime.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

static constexpr int mma_m = 32;
static constexpr int mma_k = 2;
static constexpr int mma_n = 32;
static constexpr int wavefront_size = 64;
static constexpr int c_reg_frag_size = 16;

using fp32x16_t = __attribute__((vector_size(16 * sizeof(float)))) float;

__global__ void matmul(const float* A, const float* B, float* C)
{
    float a_reg;
    float b_reg;
    fp32x16_t c_reg {};

    int l = threadIdx.x;

    const float* a_load_ptr = A + ((l % 32) * mma_k + (l / 32));
    const float* b_load_ptr = B + ((l / 32) * mma_n + (l % 32));

    a_reg = *a_load_ptr;
    b_reg = *b_load_ptr;

    c_reg = __builtin_amdgcn_mfma_f32_32x32x2f32(a_reg, b_reg, c_reg, 0, 0, 0);

    for (int i = 0; i < 16; i++)
    {
        int lane_n = l % 32;
        int lane_m = (l / 32) * 4;
        int group_m = i / 4;
        int inner_m = i % 4;

        int m = (group_m * 8) + lane_m + inner_m;
        int n = lane_n;
        C[m * mma_n + n] = c_reg[i];
    }
}

int main()
{
    float h_A[mma_m * mma_k];
    float h_B[mma_k * mma_n];
    float h_C[mma_m * mma_n];
    float h_C_ref[mma_m * mma_n];

    // Init with small random values
    srand(42);
    for (int i = 0; i < mma_m * mma_k; i++)
        h_A[i] = (float)(rand() % 10);
    for (int i = 0; i < mma_k * mma_n; i++)
        h_B[i] = (float)(rand() % 10);

    // CPU reference: C = A @ B, A is (32x2) row major, B is (2x32) row major
    for (int m = 0; m < mma_m; m++) {
        for (int n = 0; n < mma_n; n++) {
            float sum = 0.0f;
            for (int k = 0; k < mma_k; k++) {
                sum += h_A[m * mma_k + k] * h_B[k * mma_n + n];
            }
            h_C_ref[m * mma_n + n] = sum;
        }
    }

    float *d_A, *d_B, *d_C;
    hipMalloc(&d_A, mma_m * mma_k * sizeof(float));
    hipMalloc(&d_B, mma_k * mma_n * sizeof(float));
    hipMalloc(&d_C, mma_m * mma_n * sizeof(float));
    hipMemset(d_C, 0, mma_m * mma_n * sizeof(float));

    hipMemcpy(d_A, h_A, mma_m * mma_k * sizeof(float), hipMemcpyHostToDevice);
    hipMemcpy(d_B, h_B, mma_k * mma_n * sizeof(float), hipMemcpyHostToDevice);

    hipLaunchKernelGGL(matmul, dim3(1), dim3(wavefront_size), 0, 0, d_A, d_B, d_C);
    hipDeviceSynchronize();

    hipMemcpy(h_C, d_C, mma_m * mma_n * sizeof(float), hipMemcpyDeviceToHost);

    // Verify
    int errors = 0;
    for (int i = 0; i < mma_m * mma_n; i++) {
        if (fabsf(h_C[i] - h_C_ref[i]) > 1e-3f) {
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