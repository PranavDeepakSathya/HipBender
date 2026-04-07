#!/bin/bash
TORCH_DIR=/root/HipBender/.venv/lib/python3.12/site-packages/torch
PYTHON_INC=/usr/include/python3.12

# Compile kernel with hipcc
hipcc --offload-arch=gfx942 -O3 -fPIC -c matmul.hip -o matmul.o

# Compile binding with g++
g++ -O3 -shared -fPIC \
  -I${TORCH_DIR}/include \
  -I${TORCH_DIR}/include/torch/csrc/api/include \
  -I${PYTHON_INC} \
  -L${TORCH_DIR}/lib \
  -D__HIP_PLATFORM_AMD__=1 -DUSE_ROCM=1 \
  binding.cpp matmul.o \
  -ltorch -ltorch_hip -ltorch_python -lc10 -lc10_hip \
  -o hip_matmul.so