#!/usr/bin/bash
ls -l /opt/ComfyUI/custom_nodes/ComfyUI-Manager
sed -i "s/security_level\ =\ normal/security_level = weak/g" /opt/ComfyUI/custom_nodes/ComfyUI-Manager/config.ini
