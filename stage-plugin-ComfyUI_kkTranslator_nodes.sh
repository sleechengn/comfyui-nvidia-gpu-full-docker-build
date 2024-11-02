#/usr/bin/bash
set -e
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/AIGCTeam/ComfyUI_kkTranslator_nodes
sed -i '/hashlib/d' /opt/ComfyUI/custom_nodes/ComfyUI_kkTranslator_nodes/requirements.txt
sed -i '/random/d' /opt/ComfyUI/custom_nodes/ComfyUI_kkTranslator_nodes/requirements.txt
sed -i '/json/d' /opt/ComfyUI/custom_nodes/ComfyUI_kkTranslator_nodes/requirements.txt
python3.11 -m pip install -r /opt/ComfyUI/custom_nodes/ComfyUI_kkTranslator_nodes/requirements.txt
cd /opt/ComfyUI/custom_nodes/ComfyUI_kkTranslator_nodes
