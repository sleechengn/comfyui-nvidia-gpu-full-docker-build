UV 加速 PIP 安装ComfyUI PIP包，使用aria2下载cuda-toolkit

docker-compose.yml 案例

```yaml
networks:
  comfyui-network:
  lan13:
    name: lan13
    driver: macvlan
    driver_opts:
      parent: enp6s19
    ipam:
      config:
        - subnet: "192.168.13.0/24"
          gateway: "192.168.13.1"
services:
  comfyui:
    container_name: "comfyui"
    hostname: "comfyui"
    image: "192.168.13.73:5000/sleechengn/comfyui:uv"
    restart: unless-stopped
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
      - PIP_INDEX_URL=https://pypi.tuna.tsinghua.edu.cn/simple
      - PIP_EXTRA_INDEX_URL=https://download.pytorch.org/whl/cu124
    #command: ["--lowvram", "--preview-method", "auto", "--use-split-cross-attention"]
    command: ["--lowvram", "--front-end-version", "latest", "--listen", "0.0.0.0", "--disable-smart-memory","--enable-cors-header" ,"'*'"]
    #command: ["--listen", "0.0.0.0", "--disable-smart-memory", "--enable-cors-header" ,"'*'"]
    volumes:
      - comfyui-base:/opt/ComfyUI
      - comfyui-frame-interpolation:/opt/ComfyUI/custom_nodes/ComfyUI-Frame-Interpolation/ckpts
      - comfyui-wd14-model:/opt/ComfyUI/custom_nodes/ComfyUI-WD14-Tagger/models
      - comfyui-models:/opt/ComfyUI/models
      - comfyui-cn-processor:/opt/ComfyUI/custom_nodes/comfyui_controlnet_aux/ckpts
      - comfyui-output:/opt/ComfyUI/output
      - comfyui-input:/opt/ComfyUI/input
      - comfyui-huggingface_hub:/opt/huggingface_hub
      - comfyui-site-packages:/usr/local/lib/python3.10/dist-packages
      - comfyui-installer:/opt/installer
      - comfyui-user:/opt/ComfyUI/user
      - comfyui-latentsyncwrapper-models:/opt/ComfyUI/custom_nodes/ComfyUI-LatentSyncWrapper/checkpoints
      - mnt-rfs:/mnt/rfs
      - comfyui-venv:/opt/venv
      - comfyui-root:/root
      - comfyui-root-local:/root/.local
    runtime: nvidia
    deploy:
      resources:
        reservations:
          devices:
            - driver: nvidia
              count: 1
              capabilities: [gpu]
    networks:
      comfyui-network:
      lan13:
        ipv4_address: 192.168.13.52
volumes:
  comfyui-base:
    name: comfyui-base
    driver: local
    driver_opts:
      o: bind
      type: none
      device: ./comfyui/comfyui-base
  comfyui-wd14-model:
    name: comfyui-wd14-model
    driver: local
    driver_opts:
      o: bind
      type: none
      device: ./comfyui/comfyui-wd14-model
  comfyui-root-local:
    name: comfyui-root-local
    driver: local
    driver_opts:
      o: bind
      type: none
      device: ./comfyui/comfyui-root-local
  comfyui-venv:
    name: comfyui-venv
    driver: local
    driver_opts:
      o: bind
      type: none
      device: ./comfyui/comfyui-venv
  comfyui-installer:
    name: comfyui-installer
    driver: local
    driver_opts:
      o: bind
      type: none
      device: ./comfyui/comfyui-installer
  comfyui-frame-interpolation:
    name: comfyui-frame-interpolation
    driver: local
    driver_opts:
      o: bind
      type: none
      device: ./comfyui/comfyui-frame-interpolation
  comfyui-cn-processor:
    name: comfyui-cn-processor
    driver: local
    driver_opts:
      o: bind
      type: none
      device: ./comfyui/comfyui-cn-processor
  comfyui-input:
    name: comfyui-input
    driver: local
    driver_opts:
      o: bind
      type: none
      device: ./comfyui/comfyui-input
  comfyui-output:
    name: comfyui-output
    driver: local
    driver_opts:
      o: bind
      type: none
      device: ./comfyui/comfyui-output
  comfyui-huggingface_hub:
    name: comfyui-huggingface_hub
    driver: local
    driver_opts:
      o: bind
      type: none
      device: ./comfyui/comfyui-huggingface_hub
  comfyui-site-packages:
    name: comfyui-site-packages
    driver: local
    driver_opts:
      o: bind
      type: none
      device: ./comfyui/comfyui-site-packages
  comfyui-user:
    name: comfyui-user
    driver: local
    driver_opts:
      o: bind
      type: none
      device: ./comfyui/comfyui-user
  comfyui-latentsyncwrapper-models:
    name: comfyui-latentsyncwrapper-models
    driver: local
    driver_opts:
      o: bind
      type: none
      device: /mnt/nvme/ComfyUI/comfyui-latentsyncwrapper-models
  comfyui-root:
    name: comfyui-root
    driver: local
    driver_opts:
      o: bind
      type: none
      device: ./comfyui/comfyui-root
  mnt-rfs:
    name: mnt-rfs
    driver: local
    driver_opts:
      o: bind
      type: none
      device: /mnt/rfs
  comfyui-models:
    name: comfyui-models
    driver: local
    driver_opts:
      o: bind
      type: none
      device: /mnt/nvme/ComfyUI/models
```
