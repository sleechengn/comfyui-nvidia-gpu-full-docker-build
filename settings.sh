#!/usr/bin/bash

set -e

apt update
apt remove python*
apt autoremove
apt -y install wget openssh-server curl git python3.11 python3-pip nginx fonts-noto-cjk-extra ffmpeg ttyd python3.11-dev libglfw3-dev libgles2-mesa-dev freeglut3-dev

# configure ssh-server
sed -i 's/.*PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config
mkdir /run/sshd
chmod -R 700 /run/sshd
chown -R root /run/sshd
echo "root:root" | chpasswd

# setup filebrowser
curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash
mkdir /opt/filebrowser

echo "/opt/ComfyUI/python-lib" > /usr/local/lib/python3.11/dist-packages/python3_path.pth

rm -rf /etc/nginx/sites-enabled/*
python3.11 -m pip cache purge
apt autoremove

