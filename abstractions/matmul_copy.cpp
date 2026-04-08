#pragma once
#include <hip/hip_bf16.h>
#include <hip/hip_runtime.h>

typedef __bf16 bf16_t;
typedef __bf16 bf16x4_t __attribute__((ext_vector_type(4)));
typedef __bf16 bf16x8_t __attribute__((ext_vector_type(8)));
typedef float fp32x4_t __attribute__((ext_vector_type(4)));
typedef float fp32x16_t __attribute__((ext_vector_type(16)));

template <int MMA_M, int MMA_N, int MMA_K, int BM, int BN, int BK, int BlockSize>
struct SmemLoader
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
  static_assert((BM * BK / 8) % block_size == 0);
  static_assert((BN * BK / 8) % block_size == 0);
  static constexpr int bk_threads = BK/8


  int lane_id;
  int warp_id;

  __device__ SmemLoader(int l, int w) : lane_id(l), warp_id(w) {}

  __device__ __forceinline__
  void load_A(const bf16_t* A_global, bf16_t* As, int bk_idx, int K_stride) {}

  __device__ __forceinline__
  void load_B(const bf16_t* B_global, bf16_t* Bs, int bk_idx, int K_stride) {}
};