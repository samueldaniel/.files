stty -ixon

alias gst="git status"
alias ls="ls -G"
alias ll="ls -alhG"
alias tree="tree -C"
alias vim=/usr/local/bin/vim

BASE16_SHELL=$HOME/.files/colony/base16-shell/
[ -n "$PS1"  ] && [ -s $BASE16_SHELL/profile_helper.sh  ] && eval "$($BASE16_SHELL/profile_helper.sh)"

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

function _update_ps1() {
    PS1="$(~/.powerline_shell.py --shell bash --colorize-hostname --cwd-mode fancy $? 2> /dev/null)"
}
if [ "$TERM" != "linux"  ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

PATH=$HOME/.files/bin:$PATH