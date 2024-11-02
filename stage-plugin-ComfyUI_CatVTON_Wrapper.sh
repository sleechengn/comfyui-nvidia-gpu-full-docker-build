#/usr/bin/bash
set -e
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/chflame163/ComfyUI_CatVTON_Wrapper
python3.11 -m pip install -r /opt/ComfyUI/custom_nodes/ComfyUI_CatVTON_Wrapper/requirements.txt
cd /opt/ComfyUI/custom_nodes/ComfyUI_CatVTON_Wrapper
