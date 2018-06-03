#!/usr/bin/env bash
set -e
apt update
apt upgrade
apt install -y git tmux
git clone --single-branch https://github.com/samueldaniel/.files.git /home/fox
adduser fox
adduser fox sudo
echo "goodbye, cruel world..."
sudo su - fox
