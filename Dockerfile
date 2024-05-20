FROM ubuntu:jammy

RUN apt update
RUN apt -y install openssh-server nano unzip wget curl psmisc net-tools git python3.11 python3-pip nginx fonts-noto-cjk-extra ffmpeg ttyd

# configure ssh-server
RUN sed -i 's/.*PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN mkdir /run/sshd
RUN chmod -R 700 /run/sshd
RUN chown -R root /run/sshd
RUN echo "root:root" | chpasswd

# setup filebrowser
RUN curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash
RUN mkdir /opt/filebrowser

# configure
WORKDIR /opt
RUN git clone https://github.com/comfyanonymous/ComfyUI
WORKDIR /opt/ComfyUI
RUN python3.11 -m pip install -r requirements.txt --extra-index-url https://download.pytorch.org/whl/cu121

WORKDIR /opt/ComfyUI/custom_nodes
RUN git clone https://github.com/ltdrdata/ComfyUI-Manager
WORKDIR /opt/ComfyUI/custom_nodes/ComfyUI-Manager
RUN python3.11 -m pip install -r requirements.txt --extra-index-url https://download.pytorch.org/whl/cu121

WORKDIR /opt/ComfyUI/custom_nodes
RUN git clone https://github.com/Fannovel16/comfyui_controlnet_aux
WORKDIR /opt/ComfyUI/custom_nodes/comfyui_controlnet_aux
RUN python3.11 -m pip install -r requirements.txt --extra-index-url https://download.pytorch.org/whl/cu121

WORKDIR /opt/ComfyUI/custom_nodes
RUN git clone https://github.com/AlekPet/ComfyUI_Custom_Nodes_AlekPet

WORKDIR /opt/ComfyUI/custom_nodes
RUN git clone https://github.com/FizzleDorf/ComfyUI_FizzNodes
WORKDIR /opt/ComfyUI/custom_nodes/ComfyUI_FizzNodes
RUN python3.11 -m pip install -r requirements.txt --extra-index-url https://download.pytorch.org/whl/cu121

WORKDIR /opt/ComfyUI/custom_nodes
RUN git clone https://github.com/Kosinkadink/ComfyUI-AnimateDiff-Evolved

WORKDIR /opt/ComfyUI/custom_nodes
RUN git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite
WORKDIR /opt/ComfyUI/custom_nodes/ComfyUI-VideoHelperSuite
RUN python3.11 -m pip install -r requirements.txt --extra-index-url https://download.pytorch.org/whl/cu121

WORKDIR /opt/ComfyUI/custom_nodes
RUN git clone https://github.com/ZHO-ZHO-ZHO/ComfyUI-BRIA_AI-RMBG

RUN apt -y install python3.11-dev 

WORKDIR /opt/ComfyUI/custom_nodes
RUN git clone https://github.com/cubiq/ComfyUI_InstantID
WORKDIR /opt/ComfyUI/custom_nodes/ComfyUI_InstantID
RUN python3.11 -m pip install -r requirements.txt --extra-index-url https://download.pytorch.org/whl/cu121

WORKDIR /opt/ComfyUI/custom_nodes
RUN git clone https://github.com/pythongosssss/ComfyUI-Custom-Scripts

WORKDIR /opt/ComfyUI/custom_nodes
RUN git clone https://github.com/cubiq/ComfyUI_IPAdapter_plus

WORKDIR /opt/ComfyUI/custom_nodes
RUN git clone https://github.com/AIGODLIKE/AIGODLIKE-COMFYUI-TRANSLATION

WORKDIR /opt/ComfyUI/custom_nodes
RUN git clone https://github.com/crystian/ComfyUI-Crystools
WORKDIR /opt/ComfyUI/custom_nodes/ComfyUI-Crystools
RUN python3.11 -m pip install -r requirements.txt --extra-index-url https://download.pytorch.org/whl/cu121

#WORKDIR /opt/ComfyUI/custom_nodes
#RUN git clone https://github.com/ZHO-ZHO-ZHO/ComfyUI-YoloWorld-EfficientSAM
#WORKDIR /opt/ComfyUI/custom_nodes/ComfyUI-YoloWorld-EfficientSAM
#RUN python3.11 -m pip install -r requirements.txt --extra-index-url https://download.pytorch.org/whl/cu121

WORKDIR /opt/ComfyUI/custom_nodes
RUN git clone https://github.com/storyicon/comfyui_segment_anything
WORKDIR /opt/ComfyUI/custom_nodes/comfyui_segment_anything
RUN python3.11 -m pip install -r requirements.txt --extra-index-url https://download.pytorch.org/whl/cu121

WORKDIR /opt/ComfyUI/custom_nodes
RUN git clone https://github.com/Kosinkadink/ComfyUI-Advanced-ControlNet
WORKDIR /opt/ComfyUI/custom_nodes/ComfyUI-Advanced-ControlNet
RUN python3.11 -m pip install -r requirements.txt --extra-index-url https://download.pytorch.org/whl/cu121

WORKDIR /opt/ComfyUI/custom_nodes
RUN git clone https://github.com/yolain/ComfyUI-Easy-Use
WORKDIR /opt/ComfyUI/custom_nodes/ComfyUI-Easy-Use
RUN python3.11 -m pip install -r requirements.txt --extra-index-url https://download.pytorch.org/whl/cu121


# clean cache
RUN ls -l

#configure nginx
RUN rm -rf /etc/nginx/sites-enabled/*
ADD ./ComfyUI /etc/nginx/sites-enabled/

# setup and initialize
COPY ./init.sh /
RUN chmod +x /init.sh
COPY ./install.sh /
RUN chmod +x /install.sh

WORKDIR /opt/ComfyUI

ENTRYPOINT /init.sh

VOLUME /opt/ComfyUI

RUN python3.11 -m pip cache purge
RUN apt autoremove
