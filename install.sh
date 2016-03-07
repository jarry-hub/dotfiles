#Mkdir for dotfiles
dir="$HOME/.chengyi/handsome"
if [ -d  $(dir) ]
then
    /bin/rm -rf $(dir)
fi
mkdir -p $dir
cd $dir

#Install some essential package
echo "安装将花费一定时间，请耐心等待直到安装完成^_^"
if which apt-get >/dev/null; then
    sudo apt-get install -y tmux zsh git cmake build-essential python-dev ctags cscope autojump
elif which yum >/dev/null; then
    sudo yum install  -y tmux zsh git cmake build-essential python-dev ctags cscope autojump
else
    echo "you may install some essential package by you own"
fi
chsh -s /bin/zsh

#Install zsh framework oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
    echo "oh my zsh didn't exist,download......."
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

#Download my dotfiles
git clone -b develop --recursive git://github.com/chengyi818/dotfiles.git
cd dotfiles

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
