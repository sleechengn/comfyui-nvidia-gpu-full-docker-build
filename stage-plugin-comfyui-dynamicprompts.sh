#/usr/bin/bash
set -e
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/adieyal/comfyui-dynamicprompts
python3.11 -m pip install -r /opt/ComfyUI/custom_nodes/comfyui-dynamicprompts/requirements.txt
cd /opt/ComfyUI/custom_nodes/comfyui-dynamicprompts
