# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias df='df -H'
alias du='du -ch'
alias l='ls -lhtr'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../../'
alias ~='cd ~'
alias todo='vim ~/todo.txt'
function tless()
{
    if (( $# == 0 )) ; then
        column -t -s $'\t' /dev/stdin | less --chop-long-lines
    else
        column -t -s $'\t' $1 | less --chop-long-lines
    fi
}
function mkcd
{
  command mkdir -pv $1 && cd $1 && echo "Now in `pwd`"
}

# startup commands
export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8
#PS1="\W \[\e[31m\]❯\[\e[m\]\[\e[33m\]❯\[\e[m\]\[\e[32m\]❯\[\e[m\] "
PS1='$(printf ''%-11.10s'' ${PWD##*/})\[\e[31m\]❯\[\e[m\]\[\e[33m\]❯\[\e[m\]\[\e[32m\]❯\[\e[m\] '
export DISPLAY=:0.0
export LESS="-R -S"

alias som-src="cd /tigress/AKEY/akey_vol2/GTExSomaticMutations/src"

sq () { printf "\t%d -- Jobs Running\n" $(squeue -u tcomi -h | wc -l); squeue -u tcomi -S $1; }
export -f sq
alias sqhi="watch -n 120 'sq -M'"
alias sqlo="watch -n 120 'sq +M'"
alias calc="bc -l"

tmuxsplit () { 
    tmux split-window -h
    tmux selectp -t 0 
    tmux split-window -h
    tmux split-window -v
    tmux selectp -t 0 
    tmux split-window -v
}

umask 002

PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/scripts"

seffwatch () { watch -cn 300 reportseff --modified-sort; }
seffstatus () { watch -cn 300 reportseff --user $USER --modified-sort; }
weather () { while true; do
    /usr/bin/clear;
    date +"%A, %B %d, %Y  %r"
    curl -s wttr.in/princeton;
    sleep 3600;
done }
