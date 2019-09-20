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

newWorkspace '~/Work/GIT/wallspice-client/'
tmux send-keys 'npm start' 'C-m'
tmux rename-window 'wallspice'

tmux new-window
newWorkspace '~/Work/GIT/app-frontend/'
tmux send-keys 'npm run devstartLocal' 'C-m'
tmux rename-window 'localServer'

tmux new-window
newWorkspace '~/Work/GIT/acrylic/'
tmux send-keys './run-local.sh' 'C-m'
tmux rename-window 'acrylic'

tmux new-window
newWorkspace '~/Work/GIT/minicad/'
tmux send-keys './run-local.sh' 'C-m'
tmux rename-window 'minicad'

tmux new-window
newWorkspace '~/Work/GIT/wallspice-testing/'
tmux rename-window 'testing'

tmux new-window
newWorkspace '~/Personal/Projects/'
tmux rename-window 'personal'

tmux new-window
tmux rename-window 'open'

tmux select-window -t 1
tmux select-pane -t 1
tmux send-keys 'e' 'C-m'

tmux -2 attach-session -t work
