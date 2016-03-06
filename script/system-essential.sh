#!/bin/sh
#自动安装zsh及ohmyzsh环境

sudo apt-get install tmux zsh git wget cmake build-essential python-dev ctags
cscope

if [ ! -d ~/.oh-my-zsh ]; then
    echo "oh my zsh didn't exist,download......."

    wget --no-check-certificate
    https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O -
    | sh

fi
chsh -s /bin/zsh
