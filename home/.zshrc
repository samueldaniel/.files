### BEGIN set env vars
export TERM="xterm-256color"
export EDITOR="nvim"
### END set env vars
#
### BEGIN PATH manipulation
export PATH=$HOME/.local/bin:$PATH
# add ARM toolchain to path for STM32 builds
export PATH="/Users/sam/.local/gcc-arm-none-eabi-9-2019-q4-major/bin:$PATH"
### END PATH manipulation
#
### BEGIN aliases
alias ll="ls -alh"
### END aliases

### BEGIN source scripts/tools
source ~/.iterm2_shell_integration.zsh
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
### END source scripts/tools

### BEGIN pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
### END pyenv

### BEGIN git specific stuff
# git CLI tab autocompletion for zsh specifically
autoload -Uz compinit && compinit
### END git specific stuff

### BEGIN pure prompt stuff
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -Uz promptinit
promptinit
# Do not include untracked files in dirtiness check. Mostly useful on large repos (like WebKit).
export PURE_GIT_UNTRACKED_DIRTY=0
# turn on git stash status
zstyle :prompt:pure:git:stash show yes
prompt pure
bindkey -e
### END pure prompt stuff
