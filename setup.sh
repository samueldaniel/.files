#!/usr/bin/env bash
set -x

cp -r \
  .bashrc \
  .bash_logout \
  .bash_profile \
  .fzf.bash \
  .gitconfig \
  .git-completion.bash \
  .shell_utils \
  .tmux.conf \
  .tmuxline \
  $HOME

mkdir -p $HOME/.config
cp -r \
  $PWD/.config/* \
  $HOME/.config

mkdir -p $HOME/.ssh
cp -r \
  $PWD/.ssh/* \
  $HOME/.ssh
chmod 600 $HOME/.ssh/config

curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
if [ $? -ne 0 ]; then
  pushd ~/.fzf
    git pull
  popd
fi
~/.fzf/install --all --key-bindings --completion --no-update-rc

source $HOME/.bash_profile

if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Executing mac.sh"
  bash mac.sh
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "Executing linux.sh"
  bash linux.sh
else
  echo "Unknown OSTYPE: ${OSTYPE}"
fi

curl https://pyenv.run | bash
if [ $? -ne 0 ]; then
  pyenv update
fi

bash --rcfile virtualenvs.sh
