stty -ixon

alias gst="git status"
alias ls="ls --color"
alias ll="ls -alh --color"
alias tree="tree -C"
alias me='ps -ef | grep sdaniel'
alias procs="watch -n 1 'ps -e -o pid,uname,cmd,pmem,pcpu --sort=-pmem,-pcpu | head -15'"

PATH=$HOME/.local/bin:$HOME/.files/bin:$PATH

function labelpane () {
    if [ "-w" == "$1" ]
    then
        shift
        WINDOW_NAME="$@"
        echo "labelling current tmux window: ${WINDOW_NAME}"
        printf "\033k%s\033\\" "$WINDOW_NAME";
    else
        PANE_NAME="$@"
        echo "labelling current tmux pane: ${PANE_NAME}"
        printf "\033]2;%s\033\\" "$PANE_NAME";
    fi
}
export -f labelpane
alias lp=labelpane

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

$HOME/.files/.colony/powerline/scripts/powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. $HOME/.files/.colony/powerline/powerline/bindings/bash/powerline.sh
