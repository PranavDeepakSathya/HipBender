#!/bin/bash
python3 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip setuptools wheel
pip install numpy jupyter_client ipykernel ipywidgets
pip install matplotlib pandas
pip install torch torchvision --index-url https://download.pytorch.org/whl/rocm7.0
pip install triton
git config --global user.email sathya.pranav.deepak@gmail.com
git config --global user.name PranavDeepakSathya