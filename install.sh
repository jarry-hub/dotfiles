#!/usr/bin/env sh

#Install some essential package
echo "安装一些必要的软件将花费一定时间，请耐心等待直到安装完成^_^"
if which apt-get >/dev/null; then
    sudo apt-get install -y tmux zsh git cmake build-essential python-dev ctags cscope autojump
    sudo gem install homesick
elif which yum >/dev/null; then
    sudo yum install  -y tmux zsh git cmake build-essential python-dev ctags cscope autojump
    sudo gem install homesick
else
    echo "无法帮你自动安装基本软件,请手动安装!"
fi
chsh -s /bin/zsh

#Download my dotfiles
git clone -b develop --recursive git://github.com/chengyi818/dotfiles.git

#backup files
echo ""

#Install zsh framework oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
    echo "oh-my-zsh didn't exist,download and install......."
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi


#make symlink for all dotfiles
sh script_dot_use/symlink-dotfiles.sh

#Install vimrc framework spf13
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh

#source everything
source ~/.bashrc
source ~/.vimrc
source ~/.zshrc

#compile YouCompleteMe
bash script_dot_use/YouCompleteMe.sh
