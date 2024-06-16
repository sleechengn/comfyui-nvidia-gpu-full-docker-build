#!/usr/bin/bash
docker run -it -e PUID=0 -e PGID=0 -e TZ=Asia/Shanghai -e NVIDIA_DRIVER_CAPABILITIES=all -e NVIDIA_VISIBLE_DEVICES=all \
	--rm --gpus all --runtime nvidia sleechengn/comfyui:nvidia-gpu-full --lowvram
