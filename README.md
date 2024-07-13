# DOTFILES

本仓库主要是 `dot config` 文件夹中各应用的配置文件, 附带一些软件的安装说明.

## 字体安装

下载 [Nerd Font](https://www.nerdfonts.com/) 并安装, 如

```bash
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip
sudo unzip FiraCode.zip -d /usr/share/fonts/FiraCode
cd /usr/share/fonts/FiraCode
fc-cache -fv
```

## 一些编程软件的安装
### Rust and yazi

```bash
# install Rust package manager cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# install yazi file manager
cargo install --locked yazi-fm yazi-cli
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

1. 系统剪切板支持

```bash
apt install xclip
```

2. 安装 `pyright` 需要首先使用 [脚本](./scripts/downloadnodejs.fish) 安装 Nodejs.

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
# Neovim 需要
sudo apt install latexmk
```

## 配置文件

将本仓库中的配置文件软链接到 `~/.config` 文件夹下. 如 `alacritty`, `fish`, `nvim`, `pypoetry`, `yazi` 等:

```bash
ln -s $PWD/alacritty $HOME/.config/alacritty
ln -s $PWD/fish $HOME/.config/fish
ln -s $PWD/nvim $HOME/.config/nvim
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
dict: http://dict.cn/%s Dictionary
```

