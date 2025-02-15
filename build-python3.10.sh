#!/usr/bin/bash
set -e

TGT_PRX=/opt/tmp
TGT_DIR=/opt/tmp/comfyui-build-310
rm -rf $TGT_DIR && mkdir -p $TGT_PRX
/usr/bin/cp -ra $(dirname $0) $TGT_DIR

pushd $TGT_DIR
echo current $TGT_DIR
rm -rf .git
sed -i 's,python3\.11,python3.10,g' Dockerfile.stage.build
sed -i 's,python3\.11,python3.10,g' init.sh
sed -i 's,python3\.11,python3.10,g' settings.sh
find .|grep stage|grep -v grep|xargs -i sed -i 's,python3\.11,python3.10,g' {}
find ./installer/|grep .sh|grep -v grep|xargs -i sed -i 's,python3\.11,python3.10,g' {}
./build.sh 192.168.13.73:5000/sleechengn/comfyui:nvidia-gpu-full
popd

rm -rf $TGT_DIR
docker push 192.168.13.73:5000/sleechengn/comfyui:nvidia-gpu-full
