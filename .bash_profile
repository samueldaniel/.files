# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
if [ -f ~/.shell_utils ]; then
	. ~/.shell_utils
fi

# User specific environment and startup programs
alias tonka-grep="grep -ri --exclude-dir={build,.git,external,.ccls-cache,.mypy_cache}"
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
export TONKA_WORKSPACE="/data/sam/tonka"
export TURBO_POTATO_WORKSPACE="/data/sam/turbo-potato"
export PS1="$(cyan)[\u@\h$(reset):$(magenta)\w$(cyan)]$(reset) \`parse_git_branch\`\`parse_venv\`\n\\$ "

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
