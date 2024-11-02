#/usr/bin/bash
set -e
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/XLabs-AI/x-flux-comfyui
python3.11 -m pip install -r /opt/ComfyUI/custom_nodes/x-flux-comfyui/requirements.txt
cd /opt/ComfyUI/custom_nodes/x-flux-comfyui
