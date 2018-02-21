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
newTriple '~/Work/GIT/Hub/'
tmux send-keys 'npm start' 'C-m'
tmux rename-window 'hub'
tmux new-window
newTriple '~/Work/GIT/Website/'
tmux send-keys 'npm run build-css-watch' 'C-m'
tmux rename-window 'website'
tmux new-window
newTriple '~/Work/GIT/Editor/'
tmux send-keys 'npm run build_hub_watch' 'C-m'
tmux rename-window 'editor'
tmux new-window
newTriple '~/Projects/'
tmux rename-window 'personal'

tmux select-window -t 1

tmux -2 attach-session -t work
