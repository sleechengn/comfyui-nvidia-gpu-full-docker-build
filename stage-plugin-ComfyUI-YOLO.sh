#/usr/bin/bash
set -e
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/kadirnar/ComfyUI-YOLO
python3.11 -m pip install -r /opt/ComfyUI/custom_nodes/ComfyUI-YOLO/requirements.txt
cd /opt/ComfyUI/custom_nodes/ComfyUI-YOLO
