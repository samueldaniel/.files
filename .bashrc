alias gst="git status"
alias ls="ls -G"
alias ll="ls -alhG"
alias tree="tree -C"
alias me="ps -ef | grep $USER"
alias procs="watch -n 1 'ps -e -o pid,uname,cmd,pmem,pcpu --sort=-pmem,-pcpu | head -15'"

export FZF_DEFAULT_OPTS='--height 30% --border'
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PYTHONDONTWRITEBYTECODE=1
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
[ -f ~/.fzf.bash  ] && source ~/.fzf.bash
[ -f ~/.promptline.sh  ] && source ~/.promptline.sh
