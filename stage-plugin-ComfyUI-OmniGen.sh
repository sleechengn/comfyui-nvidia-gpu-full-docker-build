#/usr/bin/bash
set -e
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/1038lab/ComfyUI-OmniGen
python3.11 -m pip install -r /opt/ComfyUI/custom_nodes/ComfyUI-OmniGen/requirements.txt
cd /opt/ComfyUI/custom_nodes/ComfyUI-OmniGen
