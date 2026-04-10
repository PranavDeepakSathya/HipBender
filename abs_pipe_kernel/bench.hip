#include <hip/hip_runtime.h>
#include <hip/hip_bf16.h>
#include <stdio.h>
#include <vector>

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

    // host buffers
    std::vector<bf16_t> hA(M * K);
    std::vector<bf16_t> hB(N * K);
    std::vector<float>  hC(M * N, 0.0f);

    // fill with simple non-uniform pattern
    for (int i = 0; i < M * K; i++)
        hA[i] = bf16_t((i % 13) * 0.1f);

    for (int i = 0; i < N * K; i++)
        hB[i] = bf16_t((i % 7) * 0.2f);

    // copy to device
    hipMemcpy(dA, hA.data(), M * K * sizeof(bf16_t), hipMemcpyHostToDevice);
    hipMemcpy(dB, hB.data(), N * K * sizeof(bf16_t), hipMemcpyHostToDevice);
    hipMemcpy(dC, hC.data(), M * N * sizeof(float), hipMemcpyHostToDevice);

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