#/usr/bin/bash
set -e
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/Fannovel16/ComfyUI-Frame-Interpolation
python3.11 -m pip install -r /opt/ComfyUI/custom_nodes/ComfyUI-Frame-Interpolation/requirements-no-cupy.txt
cd /opt/ComfyUI/custom_nodes/ComfyUI-Frame-Interpolation
python3.11 install.py
