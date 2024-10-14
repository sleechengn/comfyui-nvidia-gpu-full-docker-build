#/usr/bin/bash
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/Fannovel16/ComfyUI-Frame-Interpolation
python3.11 -m pip install --extra-index-url=https://download.pytorch.org/whl/cu124 -r /opt/ComfyUI/custom_nodes/ComfyUI-Frame-Interpolation/requirements.txt
cd /opt/ComfyUI/custom_nodes/ComfyUI-Frame-Interpolation
python3.11 install.py
