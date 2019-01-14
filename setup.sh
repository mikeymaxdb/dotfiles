#!/bin/sh
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     isLinux=true;;
    Darwin*)    isMac=true;;
esac

cd ~/configuration

if [ "$isLinux" = true ]; then
    echo 'Loading Linux setup...'
    chmod +x ./setup/setup-linux.sh
    ./setup/setup-linux.sh
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
