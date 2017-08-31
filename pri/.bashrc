# .bashrc
stty -ixon

. /mnt/eng/tools/catalog/arkyd/dotfiles/.bashrc

# Custom bashrc contents go below this line

export PROMPT_COMMAND="$PROMPT_COMMAND && arkyd_env_ps1_status"
export PATH=~/.bin:$PATH

alias bgrep='rgrep -i -n --exclude-dir=external --exclude-dir=.git --exclude=.sconsign.dblite --exclude=*.ipynb'
alias cppgrep='rgrep -i -n --exclude-dir=build --exclude-dir=external --exclude-dir=.git --exclude=.sconsign.dblite --exclude=*.ipynb --include=*.h --include=*.cpp'
alias pingt2='ping 192.168.100.100'
alias pygrep='rgrep -i -n --exclude-dir=build --exclude-dir=external --exclude-dir=.git --exclude=.sconsign.dblite --exclude=*.ipynb --include=*.py'
alias ssht2='ssh root@192.168.100.100'
alias zynq-serial='picocom -b 115200 /dev/egse-tier2-console'
alias me='ps -ef | grep sdaniel'

function myfind () {
    FN_REGEX=$1
    shift
    find . -path ./build -prune -o -path ./external -prune -o -name "$FN_REGEX" -print -exec mygrep $* {} \;
}
export -f myfind

