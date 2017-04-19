stty -ixon

. /mnt/eng/tools/catalog/arkyd/dotfiles/.bashrc

alias gst="git status"
alias ls="ls -G --color"
alias ll="ls -alhG --color"
alias tree="tree -C"
alias bgrep='rgrep -i -n --exclude-dir=external --exclude-dir=.git --exclude=.sconsign.dblite --exclude=*.ipynb'
alias cppgrep='rgrep -i -n --exclude-dir=build --exclude-dir=external --exclude-dir=.git --exclude=.sconsign.dblite --exclude=*.ipynb --include=*.h --include=*.cpp'
alias pingt2='ping 192.168.100.100'
alias pygrep='rgrep -i -n --exclude-dir=build --exclude-dir=external --exclude-dir=.git --exclude=.sconsign.dblite --exclude=*.ipynb --include=*.py'
alias ssht2='ssh root@192.168.100.100'
alias zynq-serial='picocom -b 115200 /dev/egse-tier2-console'

function myfind () {
    FN_REGEX=$1
    shift
    find . -path ./build -prune -o -path ./external -prune -o -name "$FN_REGEX" -print -exec mygrep $* {} \;
}
export -f myfind

# alias vim=/usr/local/bin/vim

BASE16_SHELL=$HOME/.files/colony/base16-shell/
[ -n "$PS1"  ] && [ -s $BASE16_SHELL/profile_helper.sh  ] && eval "$($BASE16_SHELL/profile_helper.sh)"

function _update_ps1() {
    PS1="$(~/.powerline_shell.py --shell bash --colorize-hostname --cwd-mode dironly $? 2> /dev/null)"
}

if [ "$TERM" != "linux"  ]; then
    export PROMPT_COMMAND="_update_ps1; arkyd_env_ps1_status;"
fi
