#!/usr/bin/env sh

######################## BASIC VARIANT
backup_files=("$HOME/.vim" "$HOME/.vimrc" "$HOME/.bashrc" "$HOME/.zshrc" "$HOME/.vimrc.local" "$HOME/.vimrc.before.local" "$HOME/.script" "$HOME/.tmux.conf" "$HOME/.ycm_extra_conf.py" "$HOME/.vimrc.bundles.local" "$HOME/.gitconfig" "$HOME/.gvimrc")

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
    echo "$1"
    if [ -e "$1" ]; then
        msg "Attempting to back up your $(1) original configuration."
        today=`date +%Y%m%d_%s`
        mv -v "$1" "$HOME/.homesick/dotfiles_old/$1.$today";
        ret="$?"
        success "Your original $(1) configuration has been backed up."
        debug
   fi
}

######################## MAIN()
#backup files
echo "现在备份原有文件"
mkdir -p $HOME/.homesick/dotfiles_old

for i in ${backup_files[@]}; do
    do_backup "$i"
done
echo "备份完成"
