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
alias calc='bc -l'
alias tmux='TERM=xterm-256color tmux'
alias vpn='globalprotect connect -p vpntest.princeton.edu -u tcomi'

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
PS1="[\W] \$ "
export DISPLAY=:0.0

export PATH="$PATH:~/pycharm-community-2018.2.4/bin"

source /home/tcomi/miniconda3/etc/profile.d/conda.sh
conda activate base
