#/usr/bin/bash
set -e
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/kijai/ComfyUI-segment-anything-2
python3.11 -m pip install -r /opt/ComfyUI/custom_nodes/ComfyUI-segment-anything-2/requirements.txt
cd /opt/ComfyUI/custom_nodes/ComfyUI-segment-anything-2
