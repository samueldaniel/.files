#!/usr/bin/env bash

cp -r \
  $HOME/.bashrc \
  $HOME/.bash_logout \
  $HOME/.bash_profile \
  $HOME/.fzf.bash \
  $HOME/.gitconfig \
  $HOME/.shell_utils \
  $HOME/.tmux.conf \
  $HOME/.tmuxline \
  $PWD

if [[ "$OSTYPE" == "darwin"* ]]; then
  cp $HOME/.profile $PWD
fi

mkdir -p $PWD/.config
cp -r \
  $HOME/.config/nvim \
  $PWD/.config

mkdir -p $PWD/.ssh
cp \
  $HOME/.ssh/config \
  $PWD/.ssh

source $HOME/.bash_profile
pyenv activate nvim-python2
pip freeze > $PWD/requirements-nvim-python2.txt
pyenv deactivate
pyenv activate nvim-python3
pip freeze > $PWD/requirements-nvim-python3.txt
pyenv deactivate
