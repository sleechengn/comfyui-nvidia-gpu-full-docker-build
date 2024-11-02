#/usr/bin/bash
set -e
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/kijai/ComfyUI-PyramidFlowWrapper
python3.11 -m pip install -r /opt/ComfyUI/custom_nodes/ComfyUI-PyramidFlowWrapper/requirements.txt
cd /opt/ComfyUI/custom_nodes/ComfyUI-PyramidFlowWrapper
