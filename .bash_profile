# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
if [ -f ~/.shell_utils ]; then
	. ~/.shell_utils
fi

# User specific environment and startup programs
alias tonka-grep="grep -r --exclude-dir={build-ppc,build-gse,build,.git,external,.ccls-cache,.mypy_cache}"
alias tonka-ssh="ssh -o StrictHostKeyChecking=no -i ~/.ssh/tonka_id_rsa root@10.10.10.101"
export PATH="$HOME/squashfs-root/usr/bin:$PATH"
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH="/usr/share/clang:$PATH"
export HISTTIMEFORMAT="%h %d %H:%M:%S "
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTIGNORE="ls:ps:history"
export PYENV_ROOT="$HOME/.pyenv"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYTHONDONTWRITEBYTECODE=1
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
export TONKA_WORKSPACE="$HOME/tonka"
export GITHUB_PAT="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"
export XILINX_SDK_PATH="/data/tools/Xilinx/SDK/2019.1"
export PS1="$(cyan)[\u@\h$(reset):$(magenta)\w$(cyan)]$(reset) \`parse_git_branch\`\`parse_venv\`\n\\$ "

if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l ~/.ssh/id_ed25519 > /dev/null || ssh-add ~/.ssh/id_ed25519

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

if [[ "$OSTYPE" == "darwin"* ]]; then
  alias ll='ls -alhG'
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  unalias ll
  alias ll='ls -alh --color=auto'
else
  echo "Unknown OSTYPE: ${OSTYPE}"
fi
export ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_pass
