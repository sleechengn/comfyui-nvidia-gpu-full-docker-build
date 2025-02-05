#/usr/bin/bash
set -e
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/welltop-cn/ComfyUI-TeaCache
python3.11 -m pip install -r /opt/ComfyUI/custom_nodes/ComfyUI-TeaCache/requirements.txt
cd /opt/ComfyUI/custom_nodes/ComfyUI-TeaCache
