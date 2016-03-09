#!/usr/bin/env sh
######################## BASIC VARIANT
backup_files=(".vim" ".vimrc" ".bashrc" ".zshrc" ".vimrc.local" ".vimrc.before.local" ".script" ".tmux.conf" ".ycm_extra_conf.py" ".vimrc.bundles.local" ".gitconfig" ".gvimrc")
REPO_URL='chengyi818/dotfiles'

######################## BASIC SETUP TOOLS
msg() {
    printf '%b\n' "$1" >&2
}

success() {
    if [ "$ret" -eq '0' ]; then
        msg "\33[32m[✔]\33[0m ${1}${2}"
    fi
}

error() {
    msg "\33[31m[✘]\33[0m ${1}${2}"
    exit 1
}

debug() {
    if [ "$debug_mode" -eq '1' ] && [ "$ret" -gt '1' ]; then
        msg "An error occurred in function \"${FUNCNAME[$i+1]}\" on line ${BASH_LINENO[$i+1]}, we're sorry for that."
    fi
}
program_exists() {
    local ret='0'
    command -v $1 >/dev/null 2>&1 || { local ret='1'; }

    # fail on non-zero return value
    if [ "$ret" -ne 0 ]; then
        return 1
    fi

    return 0
}

program_must_exist() {
    program_exists $1

    # throw error on non-zero return value
    if [ "$?" -ne 0 ]; then
        error "You must have '$1' installed to continue."
    fi
}

install_essential_package() {
	echo "安装一些必要的软件将花费一定时间，请耐心等待直到安装完成^_^"
    	program_exists homesick
    	# throw error on non-zero return value
    	if [ "$?" -ne 0 ]; then
		sudo gem install homesick
    	fi

	if which apt-get >/dev/null; then
		sudo apt-get install -y tmux zsh git cmake build-essential python-dev ctags cscope autojump
	elif which yum >/dev/null; then
		sudo yum install  -y tmux zsh git cmake build-essential python-dev ctags cscope autojump
	else
		echo "无法帮你自动安装基本软件,请手动安装!"
	fi
}
################################## SETUP FUNCTIONS
do_backup() {
    if [ -e "$HOME/$1" ]; then
        today=`date +%Y%m%d_%s`
        mv -v "$HOME/$1" "$HOME/.homesick/dotfiles_old/$1.$today";
   fi
}

######################## MAIN()
#Install some essential package
install_essential_package

#Download chengyi818 dotfiles
program_must_exist "homesick"
echo "正在下载我为您精心准备的配置"
homesick clone "$REPO_URL"

#backup files
echo "现在备份原有文件"
mkdir -p $HOME/.homesick/dotfiles_old

for i in ${backup_files[@]}; do
    do_backup "$i"
done
echo "备份完成"


#自动安装oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
    echo "还没有安装oh-my-zsh,现在帮您自动安装,请耐性等待"
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    if [ -d ~/.oh-my-zsh ]; then
	    echo "oh-my-zsh安装完毕"
    fi
fi


#homesick自动创建软链接
homesick link --force dotfiles

#自动安装spf13框架
echo "下面为您安装spf13 vim框架"
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
echo "spf13 vim安装完毕"

#source everything
source ~/.bashrc
source ~/.vimrc
source ~/.zshrc

#自动编译YCM
if [ -d ~/.vim/bundle/YouCompleteMe ];then
    if which apt-get >/dev/null; then
        if ［ $（getconf WORD_BIT） = ‘32’ ］ && ［ $（getconf LONG_BIT） = ‘64’ ］ ; then
            cd ~/.vim/bundle/YouCompleteMe
            git submodule update --init --recursive
            ./install.py --clang-completer
            ret="$?"
            if [ "$ret" -ne '0' ];then
                echo "编译YouCompleteMe的过程中出错啦,现在帮您更换代码补全工具"
                echo "let g:spf13_bundle_groups=['general', 'writing', 'youcompleteme', 'programming', 'python', 'javascript', 'html', 'misc',]" > ~/vimrc.before.local
                vim -u "~/.spf13-vim-3/.vimrc.bundles.default" "+set nomore" "+BundleInstall!" "+BundleClean" "+qall"
            fi
        fi
    else
        echo "看起来,你必须自己手动编译YouCompleteME了"
    fi
fi

