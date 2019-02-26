#!/bin/sh

changeD(){
    tmux send-keys "cd $1" 'C-m' 'C-l'
}
newTriple(){
    changeD $1
    tmux split-window -h
    changeD $1
    tmux split-window -v
    changeD $1
}

tmux new-session -d -s work

newTriple '~/Work/GIT/wallspice-client/'
tmux send-keys 'npm start' 'C-m'
tmux split-window -v
tmux send-keys 'weechat' 'C-m'
tmux rename-window 'wallspice'

tmux new-window
newTriple '~/Work/GIT/app-frontend/'
tmux send-keys 'npm run devstartLocal' 'C-m'
tmux rename-window 'localServer'

tmux new-window
newTriple '~/Personal/Projects/'
tmux rename-window 'personal'

tmux select-window -t 1
tmux select-pane -t 1
tmux send-keys 'vim' 'C-m'

tmux -2 attach-session -t work
