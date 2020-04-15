# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
export EDITOR=/usr/bin/vim

# User specific aliases and functions
alias rm='rm -i'
alias df='df -H'
alias du='du -ch'
alias l='ls -lhtr --color'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../../'
alias ~='cd ~'
alias todo='vim ~/todo.md -c "set nospell" -c "norm zR"'
export VISUAL=nvim
alias vi=nvim
alias vim=nvim
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

entr_exe(){
    ls $1 | entr -c bash -c "sleep 1 && ./$1"
}

entr_ctest(){
    find .. -name '*.cc' -o -name '*.h' | entr -c bash -c 'sleep 1 && cmake --build . && ctest'
}

entr_pytest(){
    find -name '*.py' | entr -c bash -c 'sleep 1 && pytest'
}

# startup commands
export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8
PS1='$(printf ''%-11.10s'' "${PWD##*/}")\[\e[31m\]❯\[\e[m\]\[\e[33m\]❯\[\e[m\]\[\e[32m\]❯\[\e[m\] '
export LESS="-R -S"

alias som-src="cd /tigress/AKEY/akey_vol2/GTExSomaticMutations/src"

sq () {
    printf "\t%d / %d -- Jobs Running\n" $(squeue -u tcomi -h -t R | wc -l) $(squeue -u tcomi -h | wc -l)
    squeue -u tcomi -S $1; }
export -f sq
alias sqhi="watch -n 120 'sq -M'"
alias sqlo="watch -n 120 'sq +M'"
alias calc="bc -lq"
tgz () {
    tar -czf ${1%/}.tar.gz --remove-files ${1} &
}

tarm () {
    tar -tf $1 | grep -v /$ | tr '\n' '\0' | xargs -0 -n1 rm &
}

tmuxsplit () { 
    tmux split-window -h
    tmux selectp -t 0 
    tmux split-window -h
    tmux split-window -v
    tmux selectp -t 0 
    tmux split-window -v
}

umask 002

PATH="$HOME/.local/bin:$PATH"
PATH="$PATH:$HOME/scripts"

alias rs="reportseff --format=jobid,state,elapsed,timeeff,cpueff,memeff --modified-sort"
seffwatch () { watch -cn 300 reportseff --modified-sort --format=jobid,state,elapsed,timeeff,cpueff,memeff; }
seffstatus () { watch -cn 600 reportseff --user $USER --modified-sort --format=jobid,jobname,state,elapsed,timeeff,cpueff,memeff; }
scrubmonitor() { watch -n 3600 scrub_new.sh ; }
weather () { while true; do
    /usr/bin/clear;
    date +"%A, %B %d, %Y  %r"
    curl -s wttr.in/princeton;
    sleep 3600;
done }

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/tigress/tcomi/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/tigress/tcomi/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/tigress/tcomi/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/tigress/tcomi/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

if [[ $- == *i* ]]
then
    conda activate mybase
fi
