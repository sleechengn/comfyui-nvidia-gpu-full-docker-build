#/usr/bin/bash
cd /opt/ComfyUI/custom_nodes
git clone https://github.com/Fannovel16/ComfyUI-MotionDiff
apt install libglfw3-dev libgles2-mesa-dev freeglut3-dev -y
python3.11 -m pip install -r /opt/ComfyUI/custom_nodes/ComfyUI-MotionDiff/requirements.txt
cd /opt/ComfyUI/custom_nodes/ComfyUI-MotionDiff
python3.11 install.py
