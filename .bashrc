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
alias .='pwd'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../../'

# startup commands
export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8
PS1="\W\$ "
