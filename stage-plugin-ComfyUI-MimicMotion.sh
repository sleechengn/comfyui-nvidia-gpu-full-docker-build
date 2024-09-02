#/usr/bin/bash
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/AIFSH/ComfyUI-MimicMotion
python3.11 -m pip install --extra-index-url=https://download.pytorch.org/whl/cu121 --target=/opt/ComfyUI/python-lib -r /opt/ComfyUI/custom_nodes/ComfyUI-MimicMotion/requirements.txt
#cd /opt/ComfyUI/custom_nodes/ComfyUI-MimicMotion
