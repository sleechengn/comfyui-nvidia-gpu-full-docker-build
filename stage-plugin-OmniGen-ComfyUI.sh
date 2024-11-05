#/usr/bin/bash
set -e
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/AIFSH/OmniGen-ComfyUI
python3.11 -m pip install -r /opt/ComfyUI/custom_nodes/OmniGen-ComfyUI/requirements.txt
cd /opt/ComfyUI/custom_nodes/OmniGen-ComfyUI
