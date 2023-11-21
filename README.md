# DOTFILES

本仓库存储终端下各种配置文件. 因为配置文件多存储在 `~/.config` 文件夹下, 所以需要将本仓库中的配置文件软链接到 `~/.config` 文件夹下.

也有的配置文件存储在 `HOME` 目录下, 如

```bash
sudo ln -s $PWD/.tmux.conf ~/.tmux.conf
```

## Python3.9.18 安装脚本

首先需要下载 Python3.9.18 的安装文件

```bash
wget https://www.python.org/ftp/python/3.9.18/Python-3.9.18.tgz
```

将脚本 `installPython39.fish` 和下载好的文件 `Python-3.9.18.tgz` 放在同一目录下, 然后运行安装脚本即可实现安装:

```fish
fish ./installPython39.fish
```

