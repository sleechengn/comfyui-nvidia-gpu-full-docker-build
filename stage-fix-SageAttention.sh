#!/usr/bin/bash
set -e
cd /opt
export CUDA_HOME=/usr/local/cuda-12.6
git clone https://github.com/thu-ml/SageAttention
cd /opt/SageAttention
python3.11 -m pip install -e .
cd /opt
