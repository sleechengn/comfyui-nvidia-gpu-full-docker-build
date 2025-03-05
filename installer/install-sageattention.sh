#!/usr/bin/bash
set -e
source /root/.local/bin/env
source /opt/venv/bin/activate
echo "install SageAttention start"
cd /opt
git clone https://github.com/thu-ml/SageAttention
cd SageAttention
pip install -e .
echo "install SageAttention complate"
