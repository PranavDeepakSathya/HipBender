#include <torch/extension.h>

extern "C" void launch_matmul(void* A, void* B, void* C);

void matmul_hip(torch::Tensor A, torch::Tensor B, torch::Tensor C) {
  launch_matmul(A.data_ptr(), B.data_ptr(), C.data_ptr());
}

PYBIND11_MODULE(hip_matmul, m) {
  m.def("matmul", &matmul_hip, "MFMA matmul");
}