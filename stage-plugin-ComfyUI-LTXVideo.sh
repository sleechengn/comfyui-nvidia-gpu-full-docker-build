#/usr/bin/bash
set -e
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/Lightricks/ComfyUI-LTXVideo
python3.11 -m pip install -r /opt/ComfyUI/custom_nodes/ComfyUI-LTXVideo/requirements.txt
cd /opt/ComfyUI/custom_nodes/ComfyUI-LTXVideo
