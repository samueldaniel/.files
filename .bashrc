stty -ixon

alias gst="git status"
alias ls="ls --color"
alias ll="ls -alh --color"
alias tree="tree -C"
alias me='ps -ef | grep sdaniel'
alias procs="watch -n 1 'ps -e -o pid,uname,cmd,pmem,pcpu --sort=-pmem,-pcpu | head -15'"

export PATH=$HOME/.local/bin:$HOME/.files/bin:$PATH
export GOPATH=$HOME/go
export GREP_OPTIONS="--color=always"
export GIT_CONFIG="$HOME/.gitconfig"
export PATH=$PATH:$GOPATH/bin

BASE16_SHELL=$HOME/.files/.colony/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

export GREP_OPTIONS='--color=always'

source ~/git-completion.bash
eval "$(rbenv init -)"

export OUTREACH_PROJECT_ROOT=$HOME/repos
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
