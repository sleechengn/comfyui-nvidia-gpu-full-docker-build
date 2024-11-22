#!/usr/bin/bash
apt install -y wget
wget https://developer.download.nvidia.com/compute/cuda/12.6.3/local_installers/cuda_12.6.3_560.35.05_linux.run
chmod +x cuda_12.6.3_560.35.05_linux.run
./cuda_12.6.3_560.35.05_linux.run --silent --toolkit
rm -rf cuda_12.6.3_560.35.05_linux.run
