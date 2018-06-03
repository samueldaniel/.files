#!/usr/bin/env bash
set -e

source utils.sh

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

DOTCONFIG="$HOME/.config"
if [ ! -d "$DOTCONFIG" ]; then
    mkdir "$DOTCONFIG"
fi

curl -o "$COLONY/git-completion.bash" https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
ln -sf "$COLONY/git-completion.bash" "$HOME"
ln -sf "$DOTFILES/.gitconfig" "$HOME"

# set up tmux stuff
echo -e "\n$(green)making multitasking more difficult$(reset)"
TMUX="$COLONY/.tmux"
git clone https://github.com/tmux-plugins/tpm "$TMUX/plugins/tpm"
ln -sf "$TMUX" "$HOME"
ln -sf "$DOTFILES/.tmux.conf" "$HOME"

# shell + vim colors
echo -e "\n$(green)hiring an interior decorator$(reset)"
COLORS="$COLONY/base16-shell"
git clone https://github.com/chriskempson/base16-shell.git "$COLORS"
ln -sf "$COLORS" "$HOME/.config"

echo -e "\n$(green)authorizing black-budget R&D$(reset)"
ln -sf "$DOTFILES/.bash_profile" "$HOME"
ln -sf "$DOTFILES/.bashrc" "$HOME"
ln -sf "$DOTFILES/.vimrc" "$HOME"
ln -sf "$DOTFILES/.vimrc_background" "$HOME"

VIM="$COLONY/.vim"
cp -r "$DOTFILES/.vim" "$COLONY"
mkdir -p "$VIM/bundle"
mkdir -p "$VIM/tmp"
git clone https://github.com/VundleVim/Vundle.vim.git "$VIM/bundle/Vundle.vim"
ln -sf "$VIM" "$HOME"

vim +PluginInstall +qall

echo -e "\n$(green)building a HUD$(reset)"
BASH_IT="$COLONY/.bash_it"
git clone --depth=1 https://github.com/Bash-it/bash-it.git "$BASH_IT"
$BASH_IT/install.sh --silent --no-modify-config

echo -e "\n$(green)unbending the antennae$(reset)"
NGROK="$COLONY/ngrok"
curl -o "$NGROK.zip" https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
apt install unzip
unzip "$NGROK.zip"
ln -sf "$NGROK" "$DOTFILES/bin"

echo -e "\n$(blue)start new shell, run $(white)base16_3024$(reset)"
echo -e "$(blue)don't worry, everything will be fine!\n:D$(reset)"
