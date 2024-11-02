#!/usr/bin/bash

set -e

cd /opt
git clone https://github.com/thu-ml/SageAttention
cd /opt/SageAttention
python3.11 -m pip install .
cd /opt
