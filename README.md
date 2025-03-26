# DOTFILES

本仓库主要是 `dot config` 文件夹中各应用的配置文件, 附带一些软件的安装说明.

## 字体安装

下载 [Nerd Font](https://www.nerdfonts.com/) 并安装, 如

```bash
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FiraCode.zip
sudo unzip FiraCode.zip -d ~/.local/share/fonts/FiraCode
cd /usr/share/fonts/FiraCode
fc-cache -fv
```

## 一些编程软件的安装
### Github

很多时候 `ssh` 协议传输比较慢, 无法开代理, 不如使用 `https` 开代理快. 但是使用 `https` 通信往往需要输入邮箱和密码, 显得繁琐. 比较好的方式是使用 [GitHub’s official command line tool](https://github.com/cli/cli) 验证账户.

根据 [install linux](https://github.com/cli/cli/blob/trunk/docs/install_linux.md#debian-ubuntu-linux-raspberry-pi-os-apt), 添加 `cli` 源安装 `gh` 过程如下:

```bash
sudo mkdir -p -m 755 /etc/apt/keyrings
wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list
sudo apt update
sudo apt install gh -y
```

### Rust and Cargo

```bash
# install Rust package manager cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# install yazi file manager
cargo install --locked yazi-fm yazi-cli
```

### Nodejs

```bash
# install fnm to manager nodejs and npm
cargo install fnm
# then use fnm to install nodejs and npm
fnm install --lts --fnm-dir ~/.local/opt/nodejs
# Uninstall nodejs
fnm uninstall --fnm-dir ~/.local/opt/nodejs <version>
```

### Fish Shell

参考 [Building from source](https://github.com/fish-shell/fish-shell/?tab=readme-ov-file#building-from-source).

### Alacritty

参考 [Build Instructions](https://github.com/alacritty/alacritty/blob/master/INSTALL.md).

对于 Deepin V23 RC 在安装以下依赖后执行 `cargo build --release` 即可.

```bash
apt install pkg-config libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev
```

### Neovim

系统剪切板支持

```bash
apt install xclip
```

### xmake

```bash
curl -fsSL https://xmake.io/shget.text | bash
```

### poetry

```bash
curl -sSL https://install.python-poetry.org | python3 -
```

### Julia and juliaup

```bash
curl -fsSL https://install.julialang.org | sh
```

### Dynamic Window Manager

```bash
# dependencies for dwm
sudo apt install libxft-dev libxinerama-dev

# dependencies for feh
sudo apt install libimlib2-dev libcurl4-gnutls-dev libxt-dev
wget https://feh.finalrewind.org/feh-3.10.2.tar.bz2
tar -jxf feh-3.10.2.tar.bz2
cd feh-3.10.2
make && make install

# install rofi
sudo apt install rofi
```

## Initialize Deepin

```bash
sudo apt install tree neofetch
# remove games
sudo apt remove com.deepin.lianliankan com.deepin.gomoku
# qq
sudo apt install linux.qq.com
# QQ Music
sudo apt install com.qq.music
# wemeet
sudo apt install com.qq.wemeet
# loongnix browser
sudo apt install cn.loongnix.lbrowser
# WPS Office
sudo apt remove libreoffice-common
sudo apt autoremove
sudo apt install cn.wps.wps-office
# Baidu NetDisk
sudo apt install com.baidu.baidunetdisk
# Visual Studio Code
sudo apt install com.visualstudio.code
# Oracle VM VirtualBox
sudo apt install org.virtualbox.virtualbox
```

### LaTeX 环境配置

参考 [Deepin Linux 安装和搭建LaTex环境](https://zhuanlan.zhihu.com/p/40053417).

```bash
# 这个是最基本的, 编译器是 pdflatex, 没有 xelatex
sudo apt install texlive-base
# 安装 xelatex
sudo apt isntall texlive-xetex
# 中文包, 这样基本就能使用了
sudo apt install texlive-lang-chinese
# algorithm 包需要
sudo apt install texlive-science
# Neovim 需要
sudo apt install latexmk
```

### Neovim vimtex 插件配套 Zathura PDF 阅读器

使用源码安装的过程参考 [Zathura 安装](https://github.com/runfengtsui/Notes/blob/main/Applications/zathura.md).

## 配置文件

将本仓库中的配置文件软链接到 `~/.config` 文件夹下. 如 `alacritty`, `fish`, `nvim`, `pypoetry`, `yazi` 等:

```bash
ln -s $PWD/alacritty $HOME/.config/alacritty
ln -s $PWD/fish $HOME/.config/fish
ln -s $PWD/pypoetry $HOME/.config/pypoetry
ln -s $PWD/yazi $HOME/.config/yazi
```

也有的配置文件存储在 `HOME` 目录下, 如

```bash
ln -s $PWD/tmux/tmux.conf $HOME/.tmux.conf
```

## 浏览器插件 Vimium 配置

自定义搜索引擎

```text
baidu: https://www.baidu.com/s?wd=%s Baidu
bing: https://bing.com/search?q=%s Bing
zhihu: https://www.zhihu.com/search?q=%s ZhiHu
gitee: https://so.gitee.com/?q=%s Gitee
github: https://github.com/search?q=%s Github
bili: https://search.bilibili.com/?keyword=%s BiliBili
you: https://www.youtube.com/results?search_query=%s YouTube
dict: http://dict.cn/%s Dictionary
```

