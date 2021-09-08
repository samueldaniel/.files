#!/usr/bin/env bash
set -x

# install pyenv
curl https://pyenv.run | bash
if [ $? -ne 0 ]; then
  pyenv update
fi
source $HOME/.bash_profile

pyenv install -s 2.7.18
pyenv activate nvim-python2
if [ $? -ne 0 ]; then
  pyenv virtualenv 2.7.18 nvim-python2
  pyenv activate nvim-python2
fi
pip install --upgrade --force-reinstall -r requirements-nvim-python2.txt
pyenv deactivate

pyenv install -s 3.9.5
pyenv activate nvim-python3
if [ $? -ne 0 ]; then
  pyenv virtualenv 3.9.5 nvim-python3
  pyenv activate nvim-python3
fi
pip install --upgrade --force-reinstall -r requirements-nvim-python3.txt
pyenv deactivate

curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
if [ $? -ne 0 ]; then
  pushd ~/.fzf
    git pull
  popd
fi
~/.fzf/install --all --key-bindings --completion --no-update-rc

cp -r \
  .bashrc \
  .bash_profile \
  .fzf.bash \
  .gitconfig \
  .shell_utils \
  .tmux.conf \
  .tmuxline \
  $HOME

mkdir -p $HOME/.config
cp -r \
  $PWD/.config/* \
  $HOME/.config

if [[ "$OSTYPE" == "darwin"* ]]; then
  cp .profile $HOME
fi
