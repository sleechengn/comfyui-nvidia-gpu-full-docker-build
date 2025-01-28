#/usr/bin/bash
set -e
cd /opt/ComfyUI/custom_nodes
python3.11 -m pip install pip --upgrade
git clone https://github.com/CY-CHENYUE/ComfyUI-Janus-Pro
python3.11 -m pip install -r /opt/ComfyUI/custom_nodes/ComfyUI-Janus-Pro/requirements.txt
cd /opt/ComfyUI/custom_nodes/ComfyUI-Janus-Pro
