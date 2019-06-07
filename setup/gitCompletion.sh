#!/bin/sh
printf '\tCurling git-completion.bash ... '
if ! [ -f ~/.git-completion.bash ]; then
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -so ~/.git-completion.bash
    echo 'Done'
else
    echo 'Nothing to do'
fi
