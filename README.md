# comfyui-nvidia-gpu-full-docker-build
this only add plugins to comfyui-nvidia-gpu-base-docker-build
linux comfyui with nvidia gpu support

这是一个构建comfyui的Dockerfile项目，
支持NVIDIA GPU cuda加速

支持web文件管理
支持web tty终端
你能管理文件，也能通过web tty终端管理一切你要管理的

This is a Dockerfile project that builds comfyui,
Support NVIDIA GPU cuda acceleration

Support web file management
Support web tty terminal
You can manage files and everything you want to manage through the web tty terminal

使用指南：

以ubuntu22.04为例

1、首先你必须安装NVIDIA官方驱动，官方驱动的名称类似:
```
NVIDIAxxxxxx.run
```
在安装驱动前，你要屏蔽nouveau驱动，方法如下：

在 /etc/modprobe.d/blacklist.conf文件中，加入：
```
blacklist nouveau
```
保存后，执行：
```
update-initramfs -u -k all
```
这个操作会更新linux内核屏蔽nouveau模块

此时需要重启才能生效，如果要直接屏蔽模块不重启，请执行：
```
modprobe -r nouveau
```
2、安装必要的依赖

apt install -y make gcc g++

3、执行NVIDIA官方驱动
```
chmod +x NVIDIAxxxx.run
./NVIDIAxxx.run
```
4、重启

5、重启之后运行：
```
nvidia-smi 
```
如果没有发生错误，一切正常就代表安装成功

6、安装docker

运行脚本如下：

```
apt install -y apt-transport-https ca-certificates curl software-properties-common gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
systemctl enable docker
systemctl start docker
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
 && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
   sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
   sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

# 安装nvidia-container-toolkit
apt update
apt install -y nvidia-container-toolkit
touch /etc/docker/daemon.json
nvidia-ctk runtime configure --runtime=docker

systemctl restart docker
```

user's guidance:

Take ubuntu22.04 as an example

1. First you must install the NVIDIA official driver. The name of the official driver is similar:

NVIDIAxxxxxx.run

Before installing the driver, you need to block the nouveau driver. The method is as follows:

In the /etc/modprobe.d/blacklist.conf file, add:

blacklist nouveau

After saving, execute:

```
update-initramfs -u -k all
```

This operation will update the linux kernel to block the nouveau module

At this time, a restart is required to take effect. If you want to directly block the module without restarting, please execute:

```
modprobe -r nouveau
```
2. Install necessary dependencies

apt install -y make gcc g++

3. Execute NVIDIA official driver
```
chmod +x NVIDIAxxxx.run
./NVIDIAxxx.run
```
4. Restart

5. After restarting, run:

nvidia-smi

If no errors occur and everything is normal, the installation is successful.

6. Install docker

Run the script as follows:
```
# setup docker
apt install -y apt-transport-https ca-certificates curl software-properties-common gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
systemctl enable docker
systemctl start docker

# setup nvidia runtime for docker
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
 && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
   sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
   sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

#nvidia-container-toolkit
apt update
apt install -y nvidia-container-toolkit
# important if /etc/docker/daemon.json not exists，please create and put content {} into
# nano /etc/docker/daemon.json
# content is json string:  {}
# and save

nvidia-ctk runtime configure --runtime=docker

systemctl restart docker

```

然后使用如下的compose配置
Then use the following compose configuration



```
networks:
  lan13:
    external: true
    name: "lan13"
volumes:
  comfyui-base:
    name: comyui-base
    driver: local
    driver_opts:
      o: bind
      type: none
      device: /opt/apps/comfyui
  comfyui-wd14-model:
    name: comfyui-wd14-model
    driver: local
    driver_opts:
      o: bind
      type: none
      device: /opt/apps/comfyui-wd14-model
  comfyui-models:
    name: comyui-models
    driver: local
    driver_opts:
      o: bind
      type: none
      device: /opt/apps/comfyui-models
  comfyui-cn-processor:
    name: comfyui-cn-processor
    driver: local
    driver_opts:
      o: bind
      type: none
      device: /opt/apps/comfyui-cn-processor
  comfyui-input:
    name: comfyui-input
    driver: local
    driver_opts:
      o: bind
      type: none
      device: /opt/apps/comfyui-input
  comfyui-output:
    name: comfyui-output
    driver: local
    driver_opts:
      o: bind
      type: none
      device: /opt/apps/comfyui-output
  comfyui-huggingface_hub:
    name: comfyui-huggingface_hub
    driver: local
    driver_opts:
      o: bind
      type: none
      device: /opt/apps/comfyui-huggingface_hub
  comfyui-mimic-motion-models:
    name: comfyui-mimic-motion-models
    driver: local
    driver_opts:
      o: bind
      type: none
      device: /opt/apps/comfyui-mimic-motion-models
  comfyui-site-packages:
    name: comfyui-site-packages
    driver: local
    driver_opts:
      o: bind
      type: none
      device: /opt/apps/comfyui-site-packages
  comfyui-user:
    name: comfyui-user
    driver: local
    driver_opts:
      o: bind
      type: none
      device: /opt/apps/comfyui-user
services:
  comfyui:
    container_name: "comfyui"
    hostname: "comfyui"
    image: "sleechengn/comfyui:nvidia-gpu-full"
    restart: always
    #build:
    #  context: .
    #  shm_size: 16g
    #shm_size: 16g
    ipc: host
    ports:
      - "8080:80"
    environment:
      - PUID=0
      - PGID=0
      - TZ=Asia/Shanghai
      - NVIDIA_DRIVER_CAPABILITIES=all
      - NVIDIA_VISIBLE_DEVICES=all
      - HF_HOME=/opt/huggingface_hub
      # - HF_ENDPOINT=https://hf-mirror.com
    #command: ["--lowvram", "--preview-method", "auto", "--use-split-cross-attention"]
    command: ["--front-end-version", "latest", "--listen", "0.0.0.0", "--disable-smart-memory","--enable-cors-header" ,"'*'"]
    #command: ["--listen", "0.0.0.0", "--disable-smart-memory", "--enable-cors-header" ,"'*'"]
    volumes:
      - comfyui-base:/opt/ComfyUI
      - comfyui-wd14-model:/opt/ComfyUI/custom_nodes/ComfyUI-WD14-Tagger/models
      - comfyui-models:/opt/ComfyUI/models
      - comfyui-cn-processor:/opt/ComfyUI/custom_nodes/comfyui_controlnet_aux/ckpts
      - comfyui-output:/opt/ComfyUI/output
      - comfyui-input:/opt/ComfyUI/input
      - comfyui-huggingface_hub:/opt/huggingface_hub
      - comfyui-mimic-motion-models:/opt/ComfyUI/custom_nodes/ComfyUI-MimicMotion/models
      - comfyui-site-packages:/usr/local/lib/python3.10/dist-packages
      - comfyui-user:/opt/ComfyUI/user
#    memswap_limit: 16G
    runtime: nvidia
    # deploy:
    #   resources:
    #     limits:
    #       memory: 16G
    #     reservations:
    #       devices:
    #         - capabilities: [ gpu ]
    deploy:
      resources:
        reservations:
          devices:
            - driver: nvidia
              count: 1
              capabilities: [gpu]
```

comfyui的地址(80端口)是：
http://ip
文件管理的地址是：
http://ip/filebrowser
TTY终端的地址是
http://ip/ttyd

The address of comfyui (port 80) is:
http://ip
The address of file management is:
http://ip/filebrowser
The address of the TTY terminal is
http://ip/ttyd
