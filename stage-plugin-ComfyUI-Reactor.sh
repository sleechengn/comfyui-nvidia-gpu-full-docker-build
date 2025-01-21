#/usr/bin/bash
set -e
cd /opt/ComfyUI/custom_nodes
#git clone https://github.com/Gourieff/comfyui-reactor-node
git clone https://github.com/Gourieff/ComfyUI-ReActor
#python3.11 -m pip install -r /opt/ComfyUI/custom_nodes/comfyui-reactor-node/requirements.txt
#cd /opt/ComfyUI/custom_nodes/comfyui-reactor-node

python3.11 -m pip install -r /opt/ComfyUI/custom_nodes/ComfyUI-ReActor/requirements.txt
cd /opt/ComfyUI/custom_nodes/ComfyUI-ReActor
python3.11 install.py
