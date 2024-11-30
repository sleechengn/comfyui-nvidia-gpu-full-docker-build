#/usr/bin/bash
set -e
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/numz/Comfyui-FlowChain
python3.11 -m pip install -r /opt/ComfyUI/custom_nodes/Comfyui-FlowChain/requirements.txt
python3.11 -m pip install websocket websockets
cd /opt/ComfyUI/custom_nodes/Comfyui-FlowChain
