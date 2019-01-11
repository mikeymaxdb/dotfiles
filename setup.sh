#!/bin/sh
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     isLinux=true;;
    Darwin*)    isMac=true;;
esac

if [ "$isLinux" = true ]; then
    echo 'Loading Linux setup...'
    echo 'Linux setup is not suppored at this time, but will be!'
    exit 1
fi

if [ "$isMac" = true ]; then
    echo 'Loading Mac setup...'
    chmod +x ./setup/setup-mac.sh
    ./setup/setup-mac.sh
    exit 1
fi

echo "$unameOut is not supported at this time"
exit 1
