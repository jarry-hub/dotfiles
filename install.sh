echo 'You might need to change your default shell to zsh `sudo vim /etc/passwd`'

#Mkdir for dotfiles
dir="$HOME/.chengyi/handsome"
if [ -d  $(dir) ]
then
    /bin/rm -rf $(dir)
fi
mkdir -p $dir
cd $dir

#Install some essential package
if [ -f /usr/bin/apt-get ];then
    sudo apt-get install tmux zsh git wget cmake build-essential python-dev ctags cscope autojump
else
    echo "apt-get isn't in you system,so you need install some necessary package by you own."
fi

chsh -s /bin/zsh

#Install zsh framework oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
    echo "oh my zsh didn't exist,download......."

    wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
fi

#Download my dotfiles
git clone -b develop --recursive git://github.com/chengyi818/dotfiles.git
cd dotfiles


############################
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")
echo $SCRIPTPATH

dir=$SCRIPTPATH/..
# old dotfiles backup directory
olddir=$SCRIPTPATH/../dotfiles_old          
# list of files/folders to symlink in homedir
files="bashrc script zshrc tmux.conf ycm_extra_conf.py gitconfig vimrc.local vimrc.before.local vimrc.bundles.local"

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in current directory"
mkdir -p $olddir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Backup ~/.$file from ~ to $olddir"
    mv ~/.$file $olddir 2>/dev/null
    echo "Creating symlink to $file in home directory."
    ln -s $dir/config/$file ~/.$file
done

#Install vimrc framework spf13
cd $dir
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh

#At last source everything
source ~/.bashrc
source ~/.zshrc

#not use YouCompleteMe
#bash script/YouCompleteMe.sh
