#!/bin/sh
printf '\tCloning Tmux Plugin Manager ... '
if [ -d ~/.tmux/plugins/tpm ]; then
    echo 'Nothing to do'
else
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm >> /dev/null 2>/dev/null
    echo 'Done'
fi
