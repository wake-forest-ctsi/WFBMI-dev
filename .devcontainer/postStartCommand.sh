#!/usr/bin/env bash

chmod +x jupyter.sh 
sudo nohup bash -c "JUPYTER_ENABLE_LAB=yes GRANT_SUDO=yes start.sh jupyter lab --ServerApp.token='' --port=8888 --no-browser &"