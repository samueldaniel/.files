# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/samueldaniel/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/samueldaniel/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/samueldaniel/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/samueldaniel/.fzf/shell/key-bindings.bash"
