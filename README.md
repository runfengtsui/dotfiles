# DOTFILES

本仓库存储个人的配置文件. 

## 配置文件

因为配置文件多存储在 `~/.config` 文件夹下, 所以需要将本仓库中的配置文件软链接到 `~/.config` 文件夹下. 如 `fish`, `i3`, `nvim`, `pypoetry`, `wezterm`, `yazi` 等:

```bash
ln -s $PWD/fish $HOME/.config/fish
ln -s $PWD/i3 $HOME/.config/i3
ln -s $PWD/nvim $HOME/.config/nvim
ln -s $PWD/pypoetry $HOME/.config/pypoetry
ln -s $PWD/wezterm $HOME/.config/wezterm
ln -s $PWD/yazi $HOME/.config/yazi
```

也有的配置文件存储在 `HOME` 目录下, 如

```bash
ln -s $PWD/tmux/tmux.conf $HOME/.tmux.conf
```

## 一些软件的安装
### Rust and yazi

```bash
# install Rust package manager cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# install yazi file manager
cargo install --locked yazi-fm
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

### Python3.9.18 安装脚本

首先需要下载 Python3.9.18 的安装文件

```bash
wget https://www.python.org/ftp/python/3.9.18/Python-3.9.18.tgz
```

将脚本 `installPython39.fish` 和下载好的文件 `Python-3.9.18.tgz` 放在同一目录下, 然后运行安装脚本即可实现安装:

```fish
fish ./installPython39.fish
```

