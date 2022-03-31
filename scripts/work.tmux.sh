#!/bin/sh

changeD(){
    tmux send-keys "cd $1" 'C-m' 'C-l'
}
newWorkspace(){
    changeD $1
    tmux split-window -h
    changeD $1
    tmux split-window -v
    changeD $1
}

tmux new-session -d -s work

newWorkspace '~/Work/sugarcube-client/'
tmux send-keys 'npm start' 'C-m'
tmux rename-window 'wallspice'

tmux new-window
newWorkspace '~'
tmux rename-window 'open'

tmux new-window
newWorkspace '~'
tmux rename-window 'open'

tmux new-window
newWorkspace '~'
tmux rename-window 'open'

tmux new-window
newWorkspace '~'
tmux rename-window 'open'

tmux select-window -t 1
tmux select-pane -t 1
tmux send-keys 'e' 'C-m'

tmux -2 attach-session -t work
