#!/usr/bin/bash
apt update
apt -y install git curl

cd /opt
git clone https://github.com/comfyanonymous/ComfyUI

cd /opt/ComfyUI/custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager
git clone https://github.com/Fannovel16/comfyui_controlnet_aux
git clone https://github.com/AlekPet/ComfyUI_Custom_Nodes_AlekPet
git clone https://github.com/FizzleDorf/ComfyUI_FizzNodes
git clone https://github.com/Kosinkadink/ComfyUI-AnimateDiff-Evolved
git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite
git clone https://github.com/ZHO-ZHO-ZHO/ComfyUI-BRIA_AI-RMBG
git clone https://github.com/cubiq/ComfyUI_InstantID
git clone https://github.com/pythongosssss/ComfyUI-Custom-Scripts
git clone https://github.com/cubiq/ComfyUI_IPAdapter_plus
git clone https://github.com/AIGODLIKE/AIGODLIKE-COMFYUI-TRANSLATION
git clone https://github.com/crystian/ComfyUI-Crystools
git clone https://github.com/storyicon/comfyui_segment_anything
git clone https://github.com/Kosinkadink/ComfyUI-Advanced-ControlNet
git clone https://github.com/rgthree/rgthree-comfy
git clone https://github.com/yolain/ComfyUI-Easy-Use
git clone https://github.com/huchenlei/ComfyUI-layerdiffuse

#git clone https://github.com/comfyanonymous/ComfyUI_TensorRT

git clone https://github.com/ltdrdata/ComfyUI-Impact-Pack
git clone https://github.com/kijai/ComfyUI-SUPIR
git clone https://github.com/ltdrdata/ComfyUI-Inspire-Pack

if [ ! -d "/opt/ComfyUI/models/sams" ]; then
  mkdir /opt/ComfyUI/models/sams
fi
curl -o /opt/ComfyUI/models/sams/sam_vit_b_01ec64.pth https://dl.fbaipublicfiles.com/segment_anything/sam_vit_b_01ec64.pth
