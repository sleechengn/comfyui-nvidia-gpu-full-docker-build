#/usr/bin/bash
set -e
source /root/.local/bin/env
source /opt/venv/bin/activate
echo "install SVDQuant start"
pip install setuptools wheel
cd /opt
uv pip install git+https://github.com/asomoza/image_gen_aux.git
git clone https://github.com/mit-han-lab/nunchaku.git
cp -r /opt/nunchaku/comfyui /opt/ComfyUI/custom_nodes/svdquant
cd /opt/nunchaku
git submodule init
git submodule update
pip install -e . --no-build-isolation
cd /opt
git clone https://github.com/mit-han-lab/deepcompressor
cd deepcompressor
sed -i '/.*python\s=\s.*/d' pyproject.toml
sed -i 's@image_reward\s=\s.*@image_reward = { git = "https://github.com/THUDM/ImageReward.git", branch = "main" }@g' pyproject.toml
uvx pdm import pyproject.toml
pip install .
pip install GPUtil
