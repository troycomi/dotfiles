# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

PATH="$PATH:$HOME/.local/bin"
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
alias ~='cd ~'
alias todo='vim ~/todo.md -c "set nospell" -c "norm zR"'
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
    tmux loadb -
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

weather () { while true; do
    /usr/bin/clear;
    date +"%A, %B %d, %Y  %r"
    curl -s wttr.in/princeton;
    sleep 3600;
done }

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/tcomi/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/tcomi/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/tcomi/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/tcomi/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/tcomi/google-cloud-sdk/path.bash.inc' ]; then . '/home/tcomi/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/tcomi/google-cloud-sdk/completion.bash.inc' ]; then . '/home/tcomi/google-cloud-sdk/completion.bash.inc'; fi
