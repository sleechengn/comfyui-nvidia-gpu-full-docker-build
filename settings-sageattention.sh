#!/usr/bin/bash
cd /opt
git clone https://github.com/thu-ml/SageAttention
cd SageAttention
python3.11 -m pip install -e .
#cd /opt
#rm -rf SageAttention