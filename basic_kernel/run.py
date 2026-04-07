import torch
import sys
sys.path.insert(0, ".")
import hip_matmul

M, K, N = 4096, 4096, 4096

A = torch.randn(M, K, dtype=torch.bfloat16, device="cuda")
B_T = torch.randn(N, K, dtype=torch.bfloat16, device="cuda")
B = B_T.T

C_flat = hip_matmul.matmul(A, B_T)
C_hip = torch.as_strided(C_flat, (M, N), (1, M))

C_ref = torch.mm(A.float(), B.float())

print(f"Max error: {(C_hip - C_ref).abs().max().item():.4f}")
print(f"Mean error: {(C_hip - C_ref).abs().mean().item():.6f}")

if torch.allclose(C_hip, C_ref, atol=1.0, rtol=0.01):
    print("PASSED!")
else:
    print("FAILED!")