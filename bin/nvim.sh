#!/usr/bin/env bash
set -e
source utils.sh
echo -e "\n$(green)installing neovim$(reset)\n"
apt update
apt install -y software-properties-common
add-apt-repository ppa:neovim-ppa/stable
apt update
apt install -y python-dev python-pip python3-dev python3-pip
apt install -y neovim
echo -e "\n$(green)done installing neovim$(reset)\n"
