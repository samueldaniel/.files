export TERM="xterm-256color"
export EDITOR="nvim"

source ~/.iterm2_shell_integration.zsh
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=$HOME/.local/bin:$PATH
# add ARM toolchain to path for STM32 builds
export PATH="/Users/sam/.local/gcc-arm-none-eabi-9-2019-q4-major/bin:$PATH"

alias ll="ls -alh"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -Uz promptinit
promptinit

# Do not include untracked files in dirtiness check. Mostly useful on large repos (like WebKit).
export PURE_GIT_UNTRACKED_DIRTY=0

# turn on git stash status
zstyle :prompt:pure:git:stash show yes

prompt pure
