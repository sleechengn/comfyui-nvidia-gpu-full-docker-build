#/usr/bin/bash
set -e
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/Stability-AI/stability-ComfyUI-nodes
python3.11 -m pip install -r /opt/ComfyUI/custom_nodes/stability-ComfyUI-nodes/requirements.txt
cd /opt/ComfyUI/custom_nodes/stability-ComfyUI-nodes
