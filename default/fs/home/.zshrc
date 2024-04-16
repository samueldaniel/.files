if [[ $(uname) == "Darwin" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### BEGIN set env vars
#export TERM="tmux-256color"
export EDITOR="nvim"
if [[ $(uname) == "Darwin" ]]; then
  export LDFLAGS="-I$(brew --prefix openssl@1.1)/include -L$(brew --prefix openssl@1.1)/lib"
fi
### END set env vars
#
### BEGIN PATH manipulation
export PATH=$HOME/.local/bin:$PATH
if [[ $(uname) == "Darwin" ]]; then
else
  export PATH=$HOME/nvim-squashfs-root/usr/bin:$PATH
  export PATH=$HOME/.cargo/bin:$PATH
fi
# add ARM toolchain to path for STM32 builds
#export PATH="/Users/sam/.local/gcc-arm-none-eabi-9-2019-q4-major/bin:$PATH"
### END PATH manipulation

### BEGIN aliases
#alias ll="ls -alhG"
if [[ $(uname) == "Darwin" ]]; then
  alias ll="ls -alhG"
  # To avoid accidentally linking against a Pyenv-provided Python:
  alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
else
  alias ll="ls -alh --color"
fi
alias git-submodule-update="git submodule update --init --recursive"
### END aliases

### BEGIN source scripts/tools
source $HOME/.iterm2_shell_integration.zsh
source $HOME/zsh-git-prompt/zshrc.sh
source $HOME/powerlevel10k/powerlevel10k.zsh-theme
### END source scripts/tools

### BEGIN pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
### END pyenv
eval "$(rbenv init -)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

zstyle ':completion:*' menu select
setopt globdots
# see /usr/share/doc/zsh/examples/zshrc for examples
#setopt autocd              # change directory just by typing its name
#setopt correct            # auto correct mistakes
#setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
#setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
#setopt promptsubst         # enable command substitution in prompt
WORDCHARS=${WORDCHARS//\/} # Don't consider certain characters part of the word

# hide EOL sign ('%')
PROMPT_EOL_MARK=""

# configure key keybindings
bindkey -e                                        # emacs key bindings
bindkey ' ' magic-space                           # do history expansion on space
bindkey '^U' backward-kill-line                   # ctrl + U
bindkey '^[[3;5~' kill-word                       # ctrl + Supr
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end
#bindkey '^[[Z' undo                               # shift + tab undo last action
bindkey '^I'   complete-word       # tab          | complete
#bindkey '^[[Z' autosuggest-accept  # shift + tab  | autosuggest

autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=200000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
#setopt share_history         # share command history data

# MUST BE SOURCED AT END OF FILE
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
