#!/usr/bin/bash
set -e
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Impact-Pack
python3.11 -m pip install -r /opt/ComfyUI/custom_nodes/ComfyUI-Impact-Pack/requirements.txt
cd /opt/ComfyUI/custom_nodes/ComfyUI-Impact-Pack
python3.11 install.py
