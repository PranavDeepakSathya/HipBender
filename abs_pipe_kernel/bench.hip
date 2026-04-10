#include <hip/hip_runtime.h>
#include <hip/hip_bf16.h>
#include <stdio.h>

using bf16_t = __hip_bfloat16;

extern "C" void launch_matmul(void* A, void* B, void* C);

static constexpr int M = 8192;
static constexpr int K = 8192;
static constexpr int N = 8192;

int main() {
    bf16_t *dA, *dB;
    float *dC;

    hipMalloc(&dA, M * K * sizeof(bf16_t));
    hipMalloc(&dB, N * K * sizeof(bf16_t));
    hipMalloc(&dC, M * N * sizeof(float));

    // Zero-init is fine for profiling
    hipMemset(dA, 0, M * K * sizeof(bf16_t));
    hipMemset(dB, 0, N * K * sizeof(bf16_t));
    hipMemset(dC, 0, M * N * sizeof(float));

    // Warmup
    for (int i = 0; i < 5; i++)
        launch_matmul(dA, dB, dC);
    hipDeviceSynchronize();

    // Profiling target
    launch_matmul(dA, dB, dC);
    hipDeviceSynchronize();

    printf("Done.\n");

    hipFree(dA);
    hipFree(dB);
    hipFree(dC);
    return 0;
}