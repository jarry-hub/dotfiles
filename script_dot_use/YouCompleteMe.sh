#!/bin/sh
if [ -d ~/.vim/bundle/YouCompleteMe ];then
    cd ~/.vim/bundle/YouCompleteMe
    git submodule update --init --recursive
    ./install.py --clang-completer
fi
