# dotfiles使用说明
---

## 前言

本文主要是针对[dotfiles](https://github.com/chengyi818/dotfiles)的简要说明．
****
## dotfiles安装操作

> * 安装**curl**工具  
`sudo apt-get install curl`

> * 执行以下命令   
`curl --silent https://raw.githubusercontent.com/chengyi818/dotfiles/master/install.sh | bash`

> * 等待自动安装完成

****

## dotfiles安装流程说明
以下内容是dotfile自动安装时执行的过程
> * 安装 **homesick** `homesick工具封装了部分git命令，并增加了链接的功能`

> * 安装一些必要的软件
```
tmux zsh git cmake build-essential puthon-dev ctags cscope
aotojump trash-cli
```
> * 下载 **dotfiles**

> * 备份`/home`目录下的一些文件到`~/.homesick/dotfiles_old`目录，这些文件包括:
```
.vim .vimrc .bashrc .zshrc .vimrc.local .vimrc.before.local
.script .tmux.conf .ycm_extra_conf.py .vimrc.bundles.local
.gitconfig .gvimrc
```
> * 自动安装 **oh-my-zsh**
> * **homesick** 自动创建软链接
> * 自动安装**spf13**框架　`spf13-vim是Vim插件与配置的一个发行版本，包含了一整套精心挑选的Vim插件，采用Vundle进行插件管理，并且可以通过下列文件进行个性化配置`
```
~/.vimrc.local               #个性化配置文件
~/.vimrc.bundles.local       #本地bundle配置文件        
~/.vimrc.before.local        #早于spf13-vim加载的个性化配置文件`
```
> * 使用source 命令生效　
```
source ~/.bashrc　
source ~/.vimrc　
source ~/.zshrc
```
> * 自动编译 **YouCompleteMe** `vim自动补全神器`

----

## TMUX常用快捷键快捷
Tmux 是一个工具，用于在一个终端窗口中运行多个终端会话。不仅如此，你还可以通过 Tmux 使终端会话运行于后台或是按需接入、断开会话，这个功能非常实用。

基础操作
```
tl＋会话名　　　列出所有回话
ts＋会话名     创建一个新会话
ta＋会话名     连接到指定会话
tkss＋会话名　　移除一个会话
```
为了使自身的快捷键和其他软件的快捷键互不干扰，Tmux 提供了一个快捷键前缀。当想要使用快捷键时，需要先按下快捷键前缀，然后再按下快捷键。Tmux 所使用的快捷键前缀默认是组合键 Ctrl-x（同时按下 Ctrl 键和 x 键）。例如，假如你想通过快捷键列出当前 Tmux 中的会话（对应的快捷键是 s），那么你只需要做以下几步：
```
按下组合键 Ctrl-x (Tmux 快捷键前缀)
放开组合键 Ctrl-x
按下 s 键
```
tmux常用快捷键

***系统操作***

|快捷键|用途|
|:-------------:| -----|
|?|列出所有快捷键；按q返回|
|d|脱离当前会话；这样可以暂时返回Shell界面，输入tmux attach能够重新进入之前的会话
|D|	选择要脱离的会话；在同时开启了多个会话时使用
|Ctrl+z|	挂起当前会话
|r|强制重绘未脱离的会话
|s|	选择并切换会话；在同时开启了多个会话时使用
|:|	进入命令行模式；此时可以输入支持的命令，例如kill-server可以关闭服务器
|[|	进入复制模式；此时的操作与vi/emacs相同，按q/Esc退出
|~|	列出提示信息缓存；其中包含了之前tmux返回的各种提示信息
***窗口操作***

|快捷键|用途|
|:-------------:| -----|
|c|	创建新窗口
|&|	关闭当前窗口
|数字键|	切换至指定窗口
|p|	切换至上一窗口
|n|	切换至下一窗口
|w|	通过窗口列表切换窗口
|,|	重命名当前窗口；这样便于识别
|.|	修改当前窗口编号；相当于窗口重新排序
|f|	在所有窗口中查找指定文本
***面板操作***

|快捷键|用途|
|:-------------:| -----|
|”|	将当前面板平分为上下两块
|%|	将当前面板平分为左右两块
|x|	关闭当前面板
|!|	将当前面板置于新窗口；即新建一个窗口，其中仅包含当前面板
|Ctrl+方向键|	以1个单元格为单位移动边缘以调整当前面板大小
|Alt+方向键|	以5个单元格为单位移动边缘以调整当前面板大小
|Space|	在预置的面板布局中循环切换；依次包括even-horizontal、even-vertical、main-horizontal、main-vertical、tiled
|q|	显示面板编号
|o|	在当前窗口中选择下一面板
|方向键|	移动光标以选择面板
|{|	向前置换当前面板
|}|	向后置换当前面板
|Alt+o|	逆时针旋转当前窗口的面板
|Ctrl+o|	顺时针旋转当前窗口的面板


----

## oh-my-zsh常用快捷键
****
```
rm 　 代替　trash-put  　        为rm命令增加回收站功能
ai 　 代替sudo apt-get install　
list  代替　svn st - q
j + 文件名　　　　　　　           直接跳转到指定文件路径
csclean                        清除目录下的.cscope*和tags*文件
```
## vim常用快捷键
****
**[vim基本快捷键](http://blog.csdn.net/ceven2010/article/details/7406341)**

ctags常用快捷键：
```
gd 　　　　　　跳转到局部标识符定义处
ctrl + ]     转到光标所在函数或者变量的定义处
ctrl + t     回到跳转前的代码处
```
cscope常用快捷键：
```
ctrl + \   g 跳转到定义处
ctrl + \   c 跳转到调用处
ctrl + \   s 跳转到声明处
```
