if [ -d ~/.vim/bundle/YouCompleteMe ];then
    if which apt-get >/dev/null; then
        cd ~/.vim/bundle/YouCompleteMe
        git submodule update --init --recursive
        ./install.py --clang-completer
        ret="$?"
        if [ "$ret" -ne '0' ];then
            echo "编译YouCompleteMe的过程中出错啦,少年,你可以换个补全插件或者自己手动编译YCM"
        fi
    else
        echo "看起来,你必须自己手动编译YouCompleteME了"
    fi
fi
