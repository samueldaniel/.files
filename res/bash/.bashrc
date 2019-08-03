export PATH="$PATH:/usr/local/go/bin"
# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export JAVA_HOME="$HOME/java/jdk-12.0.1"
export PATH="$JAVA_HOME/bin:$PATH"
alias bfg="java -jar $HOME/.local/bfg-1.13.0.jar"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
