#!/bin/sh

if [ -f /usr/bin/apt-get ];then
    sudo apt-get install tmux zsh git wget cmake build-essential python-dev ctags cscope
else
    echo "apt-get isn't in you system,so you need install some necessary package by you own."
fi

chsh -s /bin/zsh
