#/usr/bin/bash
set -e
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/ShmuelRonen/ComfyUI-LatentSyncWrapper
python3.11 -m pip install -r /opt/ComfyUI/custom_nodes/ComfyUI-LatentSyncWrapper/requirements.txt
cd /opt/ComfyUI/custom_nodes/ComfyUI-LatentSyncWrapper
