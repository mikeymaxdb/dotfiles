#!/bin/sh

cd ~/configuration

echo 'Adding symlinks'
ln -sv ./gitconfig ~/.gitconfig
ln -sv ./bashrc ~/.bash_profile
ln -sv ./tmux.conf ~/.tmux.conf
ln -sv ./vimrc ~/.vimrc

cd ./setup
chmod +x ./*

echo 'Running install scripts'
./gitCompletion.sh
./tmuxPluginManager.sh

source ~/.bash_profile
echo 'Done'
