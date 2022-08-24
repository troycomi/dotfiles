function mkcd
    # make the supplied directory and cd into the new location
    command mkdir -pv $argv[1] && cd $argv[1] && echo "Now in $(pwd)"
end

function tless
    # show tab separated file with columns aligned
    if test (count $argv) -eq 0
        column -t /dev/stdin | less --chop-long-lines
    else
        column -t $argv[1] | less --chop-long-lines
    end
end

function entr_exe
    # rerun shell script after each write
    ls $argv[1] | entr -c bash -c "sleep 1 && ./$argv[1]"
end

function entr_pytest
    # rerun pytest after each python file write
    find -name '*.py' | entr -c bash -c 'sleep 1 && pytest'
end

function entr_ctest
    find .. -name '*.cc' -o -name '*.h' | \
        entr -c bash -c 'sleep 1 && cmake --build . && ctest'
end

function tmuxb
    # copy pipe to tmux buffer
    $TMUX_EXE loadb -
end

function tmuxn
    # copy pipe to tmux buffer without newlines
    tr -d '\n' | tmuxb
end

function tgz
    # compress and tar directory
    tar -czf (string trim --right --chars=/ $argv[1]).tar.gz \
        --remove-files $argv[1] &
end

function tarm
    # remove files present in tar
    tar -tf $argv[1] | grep -v '/$' | tr '\n' '\0' | xargs -0 -n1 rm -f &
end

function tmuxsplit
    tmux split-window -h
    tmux selectp -t 0
    tmux split-window -h
    tmux split-window -v
    tmux selectp -t 0
    tmux split-window -v
end

function tmuxstatus
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
end

function weather
    while true
        /usr/bin/clear;
        date +"%A, %B %d, %Y  %r"
        curl -s wttr.in/princeton;
        sleep 3600;
    end
end

function sq
    # TODO modify this to call squeue once!
    printf "\t%d / %d -- Jobs Running\n" (squeue -u $USER -h -t R | wc -l) (squeue -u $USER -h | wc -l)
    squeue -u $USER -S $argv[1]
end

function sqhi
    watch -n 120 sq -M
end
function sqlo
    watch -n 120 sq +M
end

function seffwatch
    watch -cn 300 reportseff --modified-sort
end

function seffstatus
    watch -cn 600 reportseff --user $USER --modified-sort
end
