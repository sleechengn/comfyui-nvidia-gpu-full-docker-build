#/usr/bin/bash
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/chflame163/ComfyUI_CatVTON_Wrapper
python3.11 -m pip install --extra-index-url=https://download.pytorch.org/whl/cu124 -r /opt/ComfyUI/custom_nodes/ComfyUI_CatVTON_Wrapper/requirements.txt
cd /opt/ComfyUI/custom_nodes/ComfyUI_CatVTON_Wrapper