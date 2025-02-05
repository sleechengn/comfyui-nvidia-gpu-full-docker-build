#/usr/bin/bash
set -e
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/IamCreateAI/Ruyi-Models.git
python3.11 -m pip install -r /opt/ComfyUI/custom_nodes/Ruyi-Models/requirements.txt
cd /opt/ComfyUI/custom_nodes/Ruyi-Models
