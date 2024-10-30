#!/usr/bin/bash

chmod +x /opt/combine.sh

find /opt/ComfyUI/custom_nodes|grep requirements.txt|grep -v /src/|grep -v /tests/|xargs -i /opt/combine.sh {} /opt/requirements.txt

#origin
python3.11 -m pip install async_timeout ultralytics!=8.2.5 diffusers -r /opt/requirements.txt
python3.11 -m pip install -r /opt/ComfyUI/custom_nodes/ComfyUI-GGUF/requirements.txt --force --upgrade
