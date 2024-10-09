#/usr/bin/bash
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/kadirnar/ComfyUI-YOLO
python3.11 -m pip install --extra-index-url=https://download.pytorch.org/whl/cu121 --target=/opt/ComfyUI/python-lib -r /opt/ComfyUI/custom_nodes/ComfyUI-YOLO/requirements.txt
cd /opt/ComfyUI/custom_nodes/ComfyUI-YOLO
