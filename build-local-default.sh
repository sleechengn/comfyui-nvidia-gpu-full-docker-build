#!/usr/bin/bash
set -e

TGT_PRX=/opt/tmp
TGT_DIR=$TGT_PRX/comfyui-build-310
rm -rf $TGT_DIR && mkdir -p $TGT_PRX
/usr/bin/cp -ra $(dirname $0) $TGT_DIR

pushd $TGT_DIR
echo current $TGT_DIR
rm -rf .git

#sed -i 's,ENV\sPIP_EXTRA_INDEX_URL.*,ENV PIP_EXTRA_INDEX_URL=http://192.168.13.75:8080,g' Dockerfile.stage.build
#sed -i '/ENV\sPIP_EXTRA_INDEX_URL.*/i\ENV PIP_INDEX_URL=http://192.168.13.75:8080' Dockerfile.stage.build
#sed -i '/ENV\sPIP_EXTRA_INDEX_URL.*/i\ENV PIP_TRUSTED_HOST=192.168.13.75' Dockerfile.stage.build

sed -i 's,https\:\/\/github\.com\/[^\/]*,http://192.168.13.80:3000/sleechengn,g' Dockerfile.stage.build

#./build.sh 192.168.13.73:5000/sleechengn/comfyui:uv build-libs
./build.sh 192.168.13.73:5000/sleechengn/comfyui:uv prod
popd

#rm -rf $TGT_DIR
docker push 192.168.13.73:5000/sleechengn/comfyui:uv
