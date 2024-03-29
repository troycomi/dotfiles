# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

SOURCE=${BASH_SOURCE[0]}
if [ -h "$SOURCE" ] ; then
    SOURCE="$(readlink $SOURCE)"
fi

PATH="$HOME/.local/bin:$PATH"
PATH="$PATH:$HOME/projects/scripts"

if [[ ! -z $(which nvim) ]]; then
    export EDITOR=$(which nvim)
else
    export EDITOR=/usr/bin/vim
fi

# User specific aliases and functions
alias rm='rm -i'
alias df='df -H'
alias du='du -ch'
alias ls='ls --color=auto'
alias l='ls -lhtr'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../../'
export VISUAL=$EDITOR
alias vi=$EDITOR
alias vim=$EDITOR
alias less=zless
tless()
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

# copy pipe to tmux buffer
tmuxb(){
    $TMUX_EXE loadb -
}

# copy pipe to tmux buffer without newlines
tmuxn(){
    tr -d '\n' | tmuxb
}

entr_pytest(){
    find -name '*.py' | entr -c bash -c 'sleep 1 && pytest'
}

# startup commands
export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8
PS1='$(printf ''%-11.10s'' "${PWD##*/}")\[\e[31m\]❯\[\e[m\]\[\e[33m\]❯\[\e[m\]\[\e[32m\]❯\[\e[m\] '
export LESS="-R -S"

sq () {
    printf "\t%d / %d -- Jobs Running\n" $(squeue -u $USER -h -t R | wc -l) $(squeue -u $USER -h | wc -l)
    squeue -u $USER -S $1;
}
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

lowrie_cp () {
    SMB_PATH=$1
    LOCAL_PATH=$2

    mkdir -p $2

    smbclient \
        //lowrie.princeton.edu/Brangwynne/ \
        -U princeton\\$USER \
        -c "cd \"${SMB_PATH}\"; lcd \"${LOCAL_PATH}\"; prompt; recurse; mget *"
}

tmuxsplit () {
    tmux split-window -h
    tmux selectp -t 0
    tmux split-window -h
    tmux split-window -v
    tmux selectp -t 0
    tmux split-window -v
}

tmuxstatus () {
    gpg-agent  # need to start on server restart
    tmux rename-window STATUS
    tmux split-window -h

    tmux split-window -h
    tmux selectp -t 1

    tmux resize-pane -x 127
    tmux selectp -t 0

    tmux split-window -h
    tmux selectp -t 0

    tmux split-window -v
    tmux selectp -t 0

    tmux send-keys -t 0 C-z 'sqhi' C-m
    tmux send-keys -t 1 C-z 'htop -d 600' C-m
    tmux send-keys -t 2 C-z 'seffstatus' C-m
    tmux send-keys -t 3 C-z 'weather' C-m
}

umask 002

alias rs="reportseff --color --format=jobid,state,elapsed,timeeff,cpueff,memeff --modified-sort"
seffwatch () { watch -cn 300 reportseff --color --modified-sort --format=jobid,state,elapsed,timeeff,cpueff,memeff; }
seffstatus () { watch -cn 600 reportseff --color --user $USER --modified-sort --format=jobid,jobname,state,elapsed,timeeff,cpueff,memeff; }
weather () { while true; do
    /usr/bin/clear;
    date +"%A, %B %d, %Y  %r"
    curl -s wttr.in/lexington;
    sleep 3600;
done }

source ${SOURCE}.local

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


