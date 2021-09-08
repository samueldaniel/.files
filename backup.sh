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

pyenv activate nvim-python2
pip freeze > $PWD/requirements-nvim-python2.txt
pyenv deactivate

pyenv activate nvim-python3
pip freeze > $PWD/requirements-nvim-python3.txt
pyenv deactivate

if [[ "$OSTYPE" == "darwin"* ]]; then
  cp $HOME/.profile $PWD
fi
