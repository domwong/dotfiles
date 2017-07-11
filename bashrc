alias ll='ls -l'
function parse_git_branch () {
       git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
function localhostname () {
  scutil --get LocalHostName
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"

PS1="$GREEN\u@$(localhostname)$NO_COLOUR:\w$YELLOW\$(parse_git_branch)$NO_COLOUR\$ "
 #Set git autocompletion and PS1 integration
if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
  . /usr/local/git/contrib/completion/git-completion.bash
fi
GIT_PS1_SHOWDIRTYSTATE=true
 
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi
 
export GREP_OPTIONS='--color=auto'
alias psg='ps -ef | grep'
export GOPATH=~/development/goworkspace/
export CHGO_ROOT=~/development/chgo-0.1.4
. $CHGO_ROOT/share/chgo/chgo.sh
. $CHGO_ROOT/share/chgo/auto.sh
export PATH="/usr/local/bin:$GOPATH/bin:~/bin:${PATH}"

. ~/git-completion.bash

