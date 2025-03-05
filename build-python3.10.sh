#!/usr/bin/bash
set -e

TGT_PRX=/opt/tmp
TGT_DIR=/opt/tmp/comfyui-build-310
rm -rf $TGT_DIR && mkdir -p $TGT_PRX
/usr/bin/cp -ra $(dirname $0) $TGT_DIR

pushd $TGT_DIR
echo current $TGT_DIR
rm -rf .git
./build.sh 192.168.13.73:5000/sleechengn/comfyui:uv
popd

rm -rf $TGT_DIR
docker push 192.168.13.73:5000/sleechengn/comfyui:uv
