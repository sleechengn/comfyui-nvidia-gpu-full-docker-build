#/usr/bin/bash
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/kijai/ComfyUI-segment-anything-2
python3.11 -m pip install --extra-index-url=https://download.pytorch.org/whl/cu121 --target=/opt/ComfyUI/python-lib -r /opt/ComfyUI/custom_nodes/ComfyUI-segment-anything-2/requirements.txt
cd /opt/ComfyUI/custom_nodes/ComfyUI-segment-anything-2
