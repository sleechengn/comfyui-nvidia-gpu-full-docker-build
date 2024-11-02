#/usr/bin/bash
set -e
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/kijai/ComfyUI-CogVideoXWrapper
python3.11 -m pip install -r /opt/ComfyUI/custom_nodes/ComfyUI-CogVideoXWrapper/requirements.txt
cd /opt/ComfyUI/custom_nodes/ComfyUI-CogVideoXWrapper
