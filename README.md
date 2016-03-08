#warning

目前还处于积极建设状态,离目标还有距离.

1. master分支存放的是当前使用的分支

2. develop分支是从零开始,重新建设的分支,积极建设ing

# dotfiles
成胖子的个人配置备份

##快速下载使用办法

我使用的系统是Linux Mint 17.3 Rosa 64位.
其他系统一键安装可能会有问题.但是框架和配置还是可以参考的.

原先所有配置会被备份在`~/.chengyi/handsome/dotfiles/dotfiles_old`中

请首先安装curl工具.

sudo apt-get install curl

然后执行以下命令即可:

curl --silent
https://raw.githubusercontent.com/chengyi818/dotfiles/master/install.sh | sh

## 说明
主要针对文本三巨头tmux,zsh和vim的设置

dotfilesd的同步框架选用[homesick](https://github.com/technicalpickles/homesick)

tmux设置相对比较简单,是我自己写的.

zsh设置使用的是[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

vim使用的是[spf13](https://github.com/spf13/spf13-vim)

此外还包括git和bash的设置.

##备注:

### 一

git的用户名和邮箱需要修改;

git config --global user.name "XXX"

git config --global user.mail "XXX@XXX"

### 二

安装过程中手动操作可能包括

> 刚开始的时候需要输入root密码

## 改动说明

### 一
spf13默认的代码补全插件是neocomplete,我把它改成了更强大的YouCompleteMe.

当然用过YCM的同学都知道这个强大的插件需要编译,[编译详细方法](https://github.com/Valloric/YouCompleteMe)

简易编译方法是在终端执行

> `sh ~/.chengyi/handsome/dotfiles/script_dot_use/YouCompleteMe.sh`
