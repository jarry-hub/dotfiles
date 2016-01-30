#!/bin/sh
vim +PluginInstall
killall  vim
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer

