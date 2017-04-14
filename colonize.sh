#!/usr/bin/env bash -e

pushd ~
# Install colorscheme
mkdir ~/.config
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
ln -sf ~/.files/.vimrc .vimrc
ln -sf ~/.files/.bashrc .bashrc
# start new shell, run base16_solarflare
