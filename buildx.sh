#!/usr/bin/bash
IMAGE_TAG=$1
echo build [$(dirname $0)]  Dockerfile.stage.build
if [ $IMAGE_TAG ]; then
		docker --debug buildx $(dirname $0) --file Dockerfile.stage.build --target prod -t $IMAGE_TAG
	else
		docker --debug buildx $(dirname $0) --file Dockerfile.stage.build --target prod -t sleechengn/comfyui:nvidia-gpu-full
fi
