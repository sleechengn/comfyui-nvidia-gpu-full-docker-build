#!/usr/bin/bash
IMAGE_TAG=$1
if [ $IMAGE_TAG ]; then
		docker build $(dirname $0) --file Dockerfile.stage.build --target build-libs -t $IMAGE_TAG
	else
		docker --debug build $(dirname $0) --file Dockerfile.stage.build --target build-libs -t sleechengn/comfyui:nvidia-gpu-full
fi
