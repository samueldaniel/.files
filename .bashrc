stty -ixon

alias gst="git status"
alias ls="ls -G"
alias ll="ls -alhG"
alias tree="tree -C"
alias me='ps -ef | grep sdaniel'
alias procs="watch -n 1 'ps -e -o pid,uname,cmd,pmem,pcpu --sort=-pmem,-pcpu | head -15'"

export PATH=$HOME/.local/bin:$HOME/.files/bin:$PATH
export GOPATH=$HOME/go
export GREP_OPTIONS='--color=always'

BASE16_SHELL=$HOME/.files/.colony/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

source ~/git-completion.bash
