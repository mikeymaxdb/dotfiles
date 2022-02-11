#!/bin/sh

setup(){
    tmux send-keys "cd $1" 'C-m' 'bash' 'C-m' 'C-l'
}
newWorkspace(){
    setup $1
    tmux split-window -h
    setup $1
    tmux split-window -v
    setup $1
}

tmux new-session -d -s dev

newWorkspace '~/project'
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

tmux -2 attach-session -t dev
