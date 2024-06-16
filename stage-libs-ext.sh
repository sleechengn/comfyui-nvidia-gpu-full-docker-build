#!/usr/bin/bash

#apt update
#apt -y remove python*
#apt -y autoremove
#apt install -y git python3.11 python3-pip python3.11-dev ffmpeg

#cd /opt
#mkdir /opt/ComfyUI/python-lib
#echo "/opt/ComfyUI/python-lib" > /usr/local/lib/python3.11/dist-packages/python3_path.pth

#origin
#python3.11 -m pip install --extra-index-url=https://download.pytorch.org/whl/cu121 --target=/opt/ComfyUI/python-lib -r /opt/ComfyUI/requirements.txt
#python3.11 -m pip install --timeout 10000 --use-deprecated=html5lib --trusted-host 192.168.13.81 \
#	--index-url=http://192.168.13.81:8081/repository/pip-lan/simple \
#	--extra-index-url=http://192.168.13.81:8081/repository/pip-cu121 \
#	--target=/opt/ComfyUI/python-lib -r /opt/ComfyUI/requirements.txt

chmod +x /opt/combine.sh

find /opt/ComfyUI/custom_nodes|grep requirements.txt|grep -v /src/|grep -v /tests/|xargs -i /opt/combine.sh {} /opt/requirements.txt

#origin
python3.11 -m pip install --extra-index-url=https://download.pytorch.org/whl/cu121 --target=/opt/ComfyUI/python-lib async_timeout ultralytics!=8.2.5 diffusers==0.25.0 -r /opt/requirements.txt
#python3.11 -m pip install --timeout 10000 --use-deprecated=html5lib --trusted-host 192.168.13.81 \
#	--index-url=http://192.168.13.81:8081/repository/pip-lan/simple \
#	--extra-index-url=http://192.168.13.81:8081/repository/pip-cu121 \
#	--target=/opt/ComfyUI/python-lib async_timeout ultralytics!=8.2.5 diffusers==0.25.0 -r /opt/requirements.txt
