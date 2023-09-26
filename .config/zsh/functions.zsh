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

sq () {
    printf "\t%d / %d -- Jobs Running\n" $(squeue -u $USER -h -t R | wc -l) $(squeue -u $USER -h | wc -l)
    squeue -u $USER -S $1;
}
alias sqhi="watch -n 120 'sq -M'"
alias sqlo="watch -n 120 'sq +M'"

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

tmuxstatus () {
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

seffwatch () { watch -cn 300 reportseff --modified-sort --format=jobid,state,elapsed,timeeff,cpueff,memeff; }
seffstatus () { watch -cn 600 reportseff --user $USER --modified-sort --format=jobid,jobname,state,elapsed,timeeff,cpueff,memeff; }
weather () { while true; do
    /usr/bin/clear;
    date +"%A, %B %d, %Y  %r"
    curl -s wttr.in/princeton;
    sleep 3600;
done }

secret () {
        output=~/"${1}".$(date +%s).enc
        gpg --encrypt --armor --output ${output} -r 0x450285B1BC4AE6C4 "${1}" && echo "${1} -> ${output}"
}

reveal () {
        output=$(echo "${1}" | rev | cut -c16- | rev)
        gpg --decrypt --output ${output} "${1}" && echo "${1} -> ${output}"
}

make_big(){
    wmctrl -R make_big -e 0,0,0,3840,1200  # bedroom monitors
}

ssh_reset(){
    ssh tigressgateway -O exit
}

pomo(){
  (&>/dev/null pomo_help &)
}
pomo_help(){
  pomo_work
  pomo_break
}
pomo_work(){
  aplay -q ~/sounds/powerup.wav
  sleep 25m
  aplay -q ~/sounds/beep.wav
}
pomo_break(){
  sleep 5m
  FLIP=$(($(($RANDOM%10))%2))
  if [ $FLIP -eq 1 ];then
    aplay -q ~/sounds/31.wav
  else
    aplay -q ~/sounds/60.wav
  fi
}

alias scp_prox='scp -o "ProxyJump=tigressgateway" -o "ControlPath=~/.ssh/sockets/%p-%h-%r"'
