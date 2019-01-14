#!/bin/sh

cd ~/configuration

ln -sv ./bashrc ~/.bashrc

cd ./setup
chmod +x ./*
./setup-common.sh

echo 'Done'
