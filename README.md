# DOTFILES

本仓库主要是 `dot config` 文件夹中各应用的配置文件, 附带一些软件的安装说明.

## 字体安装

下载 [Nerd Font](https://www.nerdfonts.com/) 并安装, 如

```bash
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip
sudo mkdir -p /usr/share/fonts/FiraCode
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
cargo install --locked yazi-fm
```

### Fish Shell

参考 [Building from source](https://github.com/fish-shell/fish-shell/?tab=readme-ov-file#building-from-source).

### Alacritty

参考 [Build Instructions](https://github.com/alacritty/alacritty/blob/master/INSTALL.md).

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

### Nodejs

使用 [脚本](./scripts/downloadnodejs.fish) 进行安装.

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


