#!/usr/bin/bash
set -e
echo "install SageAttention start"
cd /opt
git clone https://github.com/thu-ml/SageAttention
cd SageAttention
python3.11 -m pip install -e .
#cd /opt
#rm -rf SageAttention
echo "install SageAttention complate"
