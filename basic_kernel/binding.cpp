#include <torch/extension.h>

extern "C" void launch_matmul(void* A, void* B, void* C);

torch::Tensor matmul_hip(torch::Tensor A, torch::Tensor B) {
  int M = 4096, N = 4096;
  auto C = torch::zeros({M * N}, torch::dtype(torch::kFloat32).device(A.device()));
  launch_matmul(A.data_ptr(), B.data_ptr(), C.data_ptr());
  return C;
}

PYBIND11_MODULE(hip_matmul, m) {
  m.def("matmul", &matmul_hip, "MFMA matmul");
}