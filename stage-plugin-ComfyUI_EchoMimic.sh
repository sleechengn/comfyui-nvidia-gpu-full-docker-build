#/usr/bin/bash
set -e
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/smthemex/ComfyUI_EchoMimic
python3.11 -m pip install -r /opt/ComfyUI/custom_nodes/ComfyUI_EchoMimic/requirements.txt
cd /opt/ComfyUI/custom_nodes/ComfyUI_EchoMimic
