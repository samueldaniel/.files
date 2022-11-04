test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export LDFLAGS="-I/opt/homebrew/opt/openssl@1.1/include -L/opt/homebrew/opt/openssl@1.1/lib"
. "$HOME/.cargo/env"
