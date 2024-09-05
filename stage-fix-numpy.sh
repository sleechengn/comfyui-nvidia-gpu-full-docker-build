#!/usr/bin/bash
python3.11 -m pip install --extra-index-url=https://download.pytorch.org/whl/cu121 --target=/opt/ComfyUI/python-lib "numpy<2.0.0" --force --upgrade
