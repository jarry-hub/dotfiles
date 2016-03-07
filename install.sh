echo 'You might need to change your default shell to zsh `sudo vim /etc/passwd`'

#Mkdir for dotfiles
dir="$HOME/.chengyi/handsome"
if [ -d  $(dir) ];then
    /bin/rmdir $(dir)
    mkdir -p $dir
else
    mkdir -p $dir
fi
cd $dir


#Download my dotfiles
git clone -b develop --recursive git://github.com/chengyi818/dotfiles.git
cd dotfiles

sudo bash script/system-essential.sh
sudo bash script/symlink-dotfiles.sh

#Install vimrc framework spf13
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh

#At last source everything
source ~/.bashrc
source ~/.zshrc

#not use YouCompleteMe
#bash script/YouCompleteMe.sh
