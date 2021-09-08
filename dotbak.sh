#!/usr/bin/env bash

cp -r \
  $HOME/.bashrc \
  $HOME/.bash_profile \
  $HOME/.fzf.bash \
  $HOME/.gitconfig \
  $HOME/.shell_utils \
  $HOME/.tmux.conf \
  $HOME/.tmuxline \
  $PWD

mkdir -p $PWD/.config
cp -r \
  $HOME/.config/nvim/ \
  $PWD/.config
