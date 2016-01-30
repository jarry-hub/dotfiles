echo 'You might need to change your default shell to zsh `sudo vim /etc/passwd`'

dir="$HOME/.chengyi/handsome"
mkdir -p $dir
cd $dir
git clone --recursive git://github.com/chengyi818/dotfiles.git
cd dotfiles
sudo bash script/system-essential.sh
sudo bash script/symlink-dotfiles.sh
bash script/vim-plugin.sh
