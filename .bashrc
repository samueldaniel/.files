stty -ixon

alias gst="git status"
alias ls="ls -G"
alias ll="ls -alhG"
alias tree="tree -C"
alias me='ps -ef | grep sdaniel'
alias procs="watch -n 1 'ps -e -o pid,uname,cmd,pmem,pcpu --sort=-pmem,-pcpu | head -15'"

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

BASE16_SHELL=$HOME/.files/colony/base16-shell/
[ -n "$PS1"  ] && [ -s $BASE16_SHELL/profile_helper.sh  ] && eval "$($BASE16_SHELL/profile_helper.sh)"

function _update_ps1() {
    PS1="$(~/.powerline_shell.py --shell bash --colorize-hostname $? 2> /dev/null)"
}

if [ "$TERM" != "linux"  ]; then
    export PROMPT_COMMAND="_update_ps1;"
fi

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

PATH=$HOME/.files/bin:$PATH

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
