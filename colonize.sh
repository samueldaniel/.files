#!/bin/bash -e
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
function yellow () {
  tput setaf 3
}
function blue () {
  tput setaf 4
}
function magenta () {
  tput setaf 5
}
function cyan () {
  tput setaf 6
}
function white () {
  tput setaf 7
}
function reset () {
  tput sgr0
}

DOTFILES=$(pwd)
COLONY="$DOTFILES/.colony"

# the bit mines...
if [ -d "$COLONY" ]; then
    echo -e "$(red)uh oh! someone else got here first!$(reset)"
    read -p "$(red)do you want to take down their flag?$(reset) " answer
    case $answer in
        y|Y|yes|Yes|YES)
            echo -e "$(red)war were declared...$(reset)"
            rm -rf "$COLONY"
        ;;
        n|N|no|No|NO)
            echo -e "$(magenta)giving up!$(reset)"
            exit 1
        ;;
        *)
            echo -e "$(yellow)and now for something completely different...$(reset)"
            exit 1
        ;;
    esac
fi

if [ ! -d "$COLONY" ]; then
    echo -e "\n$(blue)$(cat $DOTFILES/federation.art)$(reset)\n"
    echo -e "\n$(green)planting a $(red)f$(white)l$(blue)a$(red)g$(green), establishing a colony$(reset)"
    mkdir "$COLONY"
fi

if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi

# powerline-shell-friendly fonts
# 2017/04/15 - Hack
echo -e "\n$(green)inventing a new conlang$(reset)"
FONTS="$COLONY/powerline-fonts"
git clone https://github.com/powerline/fonts.git $FONTS
pushd $FONTS
./install.sh
popd

# powerline-shell prompt
# 2017/04/15 - default
echo -e "\n$(green)installing HUD firmware$(reset)"
PROMPT="$COLONY/powerline-shell"
git clone https://github.com/milkbikis/powerline-shell $PROMPT
ln -sf "$PROMPT/powerline-shell.py" ~/.powerline_shell.py
ln -sf "$DOTFILES/powerline-shell-config.py" $PROMPT/config.py
pushd $PROMPT
./install.py
popd

echo -e "\n$(green)making multitasking more difficult$(reset)"
TMUX="$COLONY/.tmux"
git clone https://github.com/tmux-plugins/tpm "$TMUX/plugins/tpm"
ln -sf "$TMUX" ~/.tmux
ln -sf "$DOTFILES/.tmux.conf" ~/.tmux.conf

# shell + vim colors
# 2017/04/15 - solarflare
echo -e "\n$(green)hiring an interior decorator$(reset)"
COLORS="$COLONY/base16-shell"
git clone https://github.com/chriskempson/base16-shell.git $COLORS
ln -sf "$COLORS" ~/.config/base16-shell

echo -e "\n$(green)authorizing black-budget R&D$(reset)"
ln -sf "$DOTFILES/.bashrc" ~/.bashrc
ln -sf "$DOTFILES/.vimrc" ~/.vimrc

VIM="$COLONY/.vim"
cp -r "$DOTFILES/.vim" $VIM
mkdir -p "$VIM/bundle"
mkdir -p "$VIM/tmp"
git clone https://github.com/VundleVim/Vundle.vim.git "$VIM/bundle/Vundle.vim"
ln -sf $VIM ~/.vim

vim +PluginInstall +qall

read -p "$(red)install globals? $(reset) " answer
case $answer in
    y|Y|yes|Yes|YES)
        echo -e "$(red)if this fails, it's probably because you didn't use sudo$(reset)"
        if hash npm 2>/dev/null; then
            echo -e "$(green)npm exists$(reset)"

            echo -e "$(blue)installing a live markdown preview for vim$(reset)"
            npm install -g livedown
        else
            echo -e"$(red)npm doesn't exist!$(reset)"
        fi
    ;;
    *)
    ;;
esac


echo -e "\n$(blue)start new shell, run $(white)base16_solar-flare$(reset)"
echo -e "$(blue)don't worry, everything will be fine!\n:D$(reset)"
