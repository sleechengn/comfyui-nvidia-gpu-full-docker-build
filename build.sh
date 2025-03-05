#!/usr/bin/bash
IMAGE_TAG=$1
BUILD_TGT=prod
echo build [$(dirname $0)]  Dockerfile.stage.build
if [ $2 ]; then
	BUILD_TGT=$2
fi
if [ $IMAGE_TAG ]; then
		docker --debug build $(dirname $0) --file Dockerfile.stage.build --target $BUILD_TGT -t $IMAGE_TAG
	else
		docker --debug build $(dirname $0) --file Dockerfile.stage.build --target $BUILD_TGT -t sleechengn/comfyui:uv
fi
