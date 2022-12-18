#!/bin/bash

# install or update needed software
sudo apt-get update
sudo apt-get install -y python3 python3-venv python3-pip

# change timezone
sudo timedatectl set-timezone Asia/Tokyo

# instal the agent
curl -sSO https://dl.google.com/cloudagents/add-google-cloud-ops-agent-repo.sh
sudo bash add-google-cloud-ops-agent-repo.sh --also-install
