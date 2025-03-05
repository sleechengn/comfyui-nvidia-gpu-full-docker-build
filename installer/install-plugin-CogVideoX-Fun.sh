#/usr/bin/bash
set -e
source /root/.local/bin/env
source /opt/venv/bin/activate
echo "install CogVideoX-Fun start"
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/aigc-apps/CogVideoX-Fun
uv pip install -r /opt/ComfyUI/custom_nodes/CogVideoX-Fun/requirements.txt
cd /opt/ComfyUI/custom_nodes/CogVideoX-Fun
python install.py
echo "install CogVideoX-Fun complate"
