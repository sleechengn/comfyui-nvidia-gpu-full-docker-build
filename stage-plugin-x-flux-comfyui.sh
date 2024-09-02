#/usr/bin/bash
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/XLabs-AI/x-flux-comfyui
python3.11 -m pip install --extra-index-url=https://download.pytorch.org/whl/cu121 --target=/opt/ComfyUI/python-lib -r /opt/ComfyUI/custom_nodes/x-flux-comfyui/requirements.txt
cd /opt/ComfyUI/custom_nodes/x-flux-comfyui
