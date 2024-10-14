#/usr/bin/bash
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/AIGCTeam/ComfyUI_kkTranslator_nodes
python3.11 -m pip install --extra-index-url=https://download.pytorch.org/whl/cu124 -r /opt/ComfyUI/custom_nodes/ComfyUI_kkTranslator_nodes/requirements.txt
cd /opt/ComfyUI/custom_nodes/ComfyUI_kkTranslator_nodes
