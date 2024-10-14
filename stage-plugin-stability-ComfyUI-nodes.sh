#/usr/bin/bash
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/Stability-AI/stability-ComfyUI-nodes
python3.11 -m pip install --extra-index-url=https://download.pytorch.org/whl/cu124 -r /opt/ComfyUI/custom_nodes/stability-ComfyUI-nodes/requirements.txt
cd /opt/ComfyUI/custom_nodes/stability-ComfyUI-nodes
