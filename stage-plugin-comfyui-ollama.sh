#/usr/bin/bash
set -e
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/stavsap/comfyui-ollama
python3.11 -m pip install -r /opt/ComfyUI/custom_nodes/comfyui-ollama/requirements.txt
cd /opt/ComfyUI/custom_nodes/comfyui-ollama
