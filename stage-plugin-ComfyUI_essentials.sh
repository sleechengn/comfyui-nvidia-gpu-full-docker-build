#/usr/bin/bash
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/cubiq/ComfyUI_essentials
python3.11 -m pip install -r /opt/ComfyUI/custom_nodes/ComfyUI_essentials/requirements.txt
cd /opt/ComfyUI/custom_nodes/ComfyUI_essentials
