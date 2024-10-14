#!/usr/bin/bash

cd /opt

#origin
python3.11 -m pip install --extra-index-url=https://download.pytorch.org/whl/cu124 -r /opt/ComfyUI/requirements.txt
