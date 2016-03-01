#warning
目前还处于积极建设状态,离目标还有距离.

1. master分支存放的是当前使用的分支
2. develop分支是从零开始,重新建设的分支,积极建设ing


# dotfiles
成胖子的个人配置备份

##快速下载使用办法

本dotfiles主要针对64位的Ubuntu和Mint系统.其他系统可能会有问题.

试试也无妨,原先所有配置会被备份在`~/.chengyi/handsome/dotfiles/dotfiles_old`中

我使用的系统是Linux Mint 17.3 Rosa 64位.

请首先安装curl工具.

sudo apt-get install curl

然后执行以下命令即可:

curl --silent https://raw.githubusercontent.com/chengyi818/dotfiles/master/install.sh | sh

##备注:

### 一

git的用户名和邮箱需要修改;

git config --global user.name "XXX"

git config --global user.mail "XXX@XXX"

### 二

目前还处于初级阶段,安装过程中手动操作可能包括

> 刚开始的时候需要输入root密码

> 在vim插件安装完成后,手动退出vim
