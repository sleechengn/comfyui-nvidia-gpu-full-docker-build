#/usr/bin/bash
set -e
echo "install CogVideoX-Fun start"
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/aigc-apps/CogVideoX-Fun
python3.11 -m pip install -r /opt/ComfyUI/custom_nodes/CogVideoX-Fun/requirements.txt
cd /opt/ComfyUI/custom_nodes/CogVideoX-Fun
python3.11 install.py
echo "install CogVideoX-Fun complate"
