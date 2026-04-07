import torch
import sys
from triton.testing import do_bench
sys.path.insert(0, ".")
import hip_matmul

M, K, N = 8192, 8192, 8192

A = torch.randn(M, K, dtype=torch.bfloat16, device="cuda")
B_T = torch.randn(N, K, dtype=torch.bfloat16, device="cuda")
B = B_T.T
C_flat = torch.zeros(M * N, dtype=torch.float32, device="cuda")

hip_matmul.matmul(A, B_T, C_flat)
C_hip = torch.as_strided(C_flat, (M, N), (1, M))

C_ref = torch.mm(A.float(), B.float())

print(f"Max error: {(C_hip - C_ref).abs().max().item():.4f}")
print(f"Mean error: {(C_hip - C_ref).abs().mean().item():.6f}")

if torch.allclose(C_hip, C_ref, atol=1.0, rtol=0.01):
    print("PASSED!")
else:
    print("FAILED!")

def run():
  hip_matmul.matmul(A, B_T, C_flat)

ms = do_bench(run, return_mode="median")
tflops = (2 * M * K * N * 1e-12) / (ms * 1e-3)
print(f"{ms:.3f} ms, {tflops:.1f} TFLOPS")