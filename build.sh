#!/usr/bin/bash
docker build $(dirname $0) --filename Dockerfile -t sleechengn/comfyui:nvidia-gpu-full
