#!/bin/bash

# install or update needed software
sudo apt-get update
sudo apt-get install -y python3 python3-venv python3-pip
pip install TikTokApi
python3 -m playwright install
sudo apt-get install libgtk-3-0
python3 -m playwright install-deps

# change timezone
sudo timedatectl set-timezone Asia/Tokyo

# set tiktok script environment
cd ~
python3 -m venv tiktok
