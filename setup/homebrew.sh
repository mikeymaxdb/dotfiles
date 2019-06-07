#!/bin/sh
printf '\tInstalling Homebrew ... '
if ! [ "$(command -v brew)" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo 'Done'
else
    echo 'Nothing to do'
fi
