if [[ ! -z $(which nvim) ]]; then
    export EDITOR=$(which nvim)
else
    export EDITOR=/usr/bin/vim
fi

alias rm='rm -i'
alias df='df -H'
alias du='du -ch'
alias ls='ls --color=auto'
alias l='ls -lhtr'

export VISUAL=$EDITOR
alias vi=$EDITOR
alias vim=$EDITOR

alias less=zless

alias calc="bc -lq"

alias rs="reportseff --format=jobid,state,elapsed,timeeff,cpueff,memeff --modified-sort"

alias mount_lowrie="sudo mount -v -t cifs //lowrie.princeton.edu/Brangwynne/ /mnt/brangwynne -o credentials=/etc/win-credentials"

alias gpg_enc="gpg --enrypt --armor --recipient 0x450285B1BC4AE6C4" # -o output input
alias gpg_dec="gpg --decrypt --armor"  # filename
