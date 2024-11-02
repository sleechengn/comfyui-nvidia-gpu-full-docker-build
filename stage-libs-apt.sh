#!/usr/bin/bash

set -e

apt update
apt -y remove python*
apt -y autoremove
apt install -y git python3.11 python3-pip python3.11-dev ffmpeg

