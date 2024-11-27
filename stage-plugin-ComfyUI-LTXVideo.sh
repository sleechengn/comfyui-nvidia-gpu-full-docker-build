#/usr/bin/bash
set -e
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/Lightricks/ComfyUI-LTXVideo
#python3.11 -m pip install -r /opt/ComfyUI/custom_nodes/ComfyUI-LTXVideo/requirements.txt
python3.11 -m pip install ltx-video@git+https://github.com/Lightricks/LTX-Video.git@ltx-video-0.9
python3.11 -m pip install comfyui-easynodes
python3.11 -m pip install huggingface_hub==0.25.2
cd /opt/ComfyUI/custom_nodes/ComfyUI-LTXVideo
