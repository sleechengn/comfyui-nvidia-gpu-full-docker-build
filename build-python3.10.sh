#!/usr/bin/bash
set -e

rm -rf /opt/tmp/comfyui-build-310
mkdir -p /opt/tmp
/usr/bin/cp -ra . /opt/tmp/comfyui-build-310

cd /opt/tmp/comfyui-build-310
echo current $(pwd)
rm -rf .git
sed -i 's,python3\.11,python3.10,g' Dockerfile.stage.build
sed -i 's,python3\.11,python3.10,g' init.sh
sed -i 's,python3\.11,python3.10,g' settings.sh
find .|grep stage|grep -v grep|xargs -i sed -i 's,python3\.11,python3.10,g' {}

./build.sh
rm -rf /opt/tmp/comfyui-build-310
