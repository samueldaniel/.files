alias vim=/usr/local/bin/vim
alias ls="ls -G"
alias ll="ls -alh"

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1"  ] && [ -s $BASE16_SHELL/profile_helper.sh  ] && eval "$($BASE16_SHELL/profile_helper.sh)"

