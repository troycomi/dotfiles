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
alias ~='cd ~'
function mkcd
{
  command mkdir -pv $1 && cd $1 && echo "Now in `pwd`"
}

# startup commands
export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8
PS1="[\W] \$ "
export DISPLAY=:0.0

# added by Miniconda3 installer
export PATH="/home/tcomi/miniconda3/bin:$PATH"
export PATH="$PATH:~/pycharm-community-2018.2.4/bin"
