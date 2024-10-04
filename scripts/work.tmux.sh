#!/bin/sh

sessionName='work'
configPath="$HOME/Work/workspaces.txt"

changeDirectory(){
    tmux send-keys "cd $1" 'C-m' 'C-l'
}

newWorkspace(){
    changeDirectory $1
    tmux split-window -h
    changeDirectory $1
    tmux split-window -v
    changeDirectory $1
    tmux split-window -v
    changeDirectory $1
}

tmux new-session -d -s "$sessionName"

while read workspace; do
    name=$(echo $workspace | cut -f 1 -d ' ')
    directory=$(echo $workspace | cut -f 2 -d ' ')

    echo "Creating workspace $name in $directory"

    newWorkspace "$directory"
    tmux rename-window "$name"
    tmux new-window
done < "$configPath"

tmux kill-window

tmux select-window -t 1
tmux select-pane -t 1

tmux -2 attach-session -t "$sessionName"
