#/usr/bin/bash
set -e
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/AIFSH/ComfyUI-MimicMotion
python3.11 -m pip install -r /opt/ComfyUI/custom_nodes/ComfyUI-MimicMotion/requirements.txt
#cd /opt/ComfyUI/custom_nodes/ComfyUI-MimicMotion
