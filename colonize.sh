#!/usr/bin/env bash -e
# Num  Colour    #define         R G B
# 0    black     COLOR_BLACK     0,0,0
# 1    red       COLOR_RED       1,0,0
# 2    green     COLOR_GREEN     0,1,0
# 3    yellow    COLOR_YELLOW    1,1,0
# 4    blue      COLOR_BLUE      0,0,1
# 5    magenta   COLOR_MAGENTA   1,0,1
# 6    cyan      COLOR_CYAN      0,1,1
# 7    white     COLOR_WHITE     1,1,1
function red () {
  tput setaf 1
}
function green () {
  tput setaf 2
}
function blue () {
  tput setaf 4
}
function white() {
  tput setaf 7
}
function reset () {
  tput sgr0
}

tput setab [1-7] # Set the background colour using ANSI escape
tput setaf [1-7] # Set the foreground colour using ANSI escape


DOTFILES=$(pwd)

# the bit mines...

echo -e "\n$(green)planting a flag, establishing a colony$(reset)\n"
mkdir -p colony

# powerline-shell-friendly fonts
# 2017/04/15 - Hack
echo -e "\n$(green)inventing a new conlang$(reset)\n"
FONTS="$DOTFILES/colony/powerline-fonts"
git clone https://github.com/powerline/fonts.git $FONTS
pushd $FONTS
./install.sh
popd

# powerline-shell prompt
# 2017/04/15 - default
echo -e "\n$(green)installing HUD firmware$(reset)\n"
PROMPT="$DOTFILES/colony/powerline-shell"
git clone https://github.com/milkbikis/powerline-shell $PROMPT
ln -sf "$PROMPT/powerline-shell.py" ~/.powerline_shell.py
ln -sf "$DOTFILES/powerline-shell-config.py" $PROMPT/config.py
pushd colony/powerline-shell
./install.py
popd

# shell + vim colors
# 2017/04/15 - solarflare
echo -e "\n$(green)hiring an interior decorator$(reset)\n"
git clone https://github.com/chriskempson/base16-shell.git colony/base16-shell

echo -e "\n$(green)authorizing black-budget R&D$(reset)\n"
ln -sf "$DOTFILES/.tmux.conf" ~/.tmux.conf
ln -sf "$DOTFILES/.vimrc" ~/.vimrc
ln -sf "$DOTFILES/.bashrc" ~/.bashrc

VIM="$DOTFILES/colony/.vim"
cp -r "$DOTFILES/.vim-template" $VIM
mkdir -p "$VIM/bundle"
mkdir -p "$VIM/tmp"
ln -sf "$VIM" ~/.vim/
git clone https://github.com/VundleVim/Vundle.vim.git "$VIM/bundle/Vundle.vim"

vim +PluginInstall +qall

echo -e "\n$(blue)start new shell, run $(white)base16_solarflare$(reset)\n"

