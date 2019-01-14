#!/bin/sh

cd ~/configuration

ln -sv ./gitconfig ~/.gitconfig
ln -sv ./tmux.conf ~/.tmux.conf
ln -sv ./vimrc ~/.vimrc

cd ./setup
chmod +x ./*

./gitCompletion.sh
./tmuxPluginManager.sh
