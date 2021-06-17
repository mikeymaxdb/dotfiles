#!/bin/sh
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     isLinux=true;;
    Darwin*)    isMac=true;;
esac

echo 'Setting up configuration\n'

# ---------------------------

cd ~/configuration

printf 'Creating symlinks ... '
ln -sf ~/configuration/gitconfig ~/.gitconfig
ln -sf ~/configuration/tmux.conf ~/.tmux.conf
ln -sf ~/configuration/vimrc ~/.vimrc
ln -sf ~/configuration/nvim ~/.config/nvim

if [ "$isLinux" = true ]; then
    ln -sf ~/configuration/bashrc ~/.bashrc
fi

if [ "$isMac" = true ]; then
    ln -sf ~/configuration/bashrc ~/.bash_profile
fi
echo 'Done\n'

# ---------------------------

cd ./setup
chmod +x ./*

echo 'Installing plugins...'
./gitCompletion.sh
# ./tmuxPluginManager.sh
echo 'Done\n'

# TODO: Add linux setup here (Awesome, conky, etc.)

echo 'Installing packages...'
if [ "$isMac" = true ]; then
    ./homebrew.sh
fi
echo 'Done\n'

echo 'Configuration set up'

exit 1
