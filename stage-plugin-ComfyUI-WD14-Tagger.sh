#/usr/bin/bash
set -e
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/pythongosssss/ComfyUI-WD14-Tagger
python3.11 -m pip install -r /opt/ComfyUI/custom_nodes/ComfyUI-WD14-Tagger/requirements.txt
cd /opt/ComfyUI/custom_nodes/ComfyUI-WD14-Tagger
