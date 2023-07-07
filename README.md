# DOTFILES

本仓库存储终端下各种配置文件. 因为配置文件多存储在 `~/.config` 文件夹下, 所以需要将本仓库中的配置文件软链接到 `~/.config` 文件夹下. 如

```bash
sudo ln -s $PWD/nvim ~/.config/nvim
```

也有的配置文件存储在 `HOME` 目录下, 如

```bash
sudo ln -s $PWD/.tmux.conf ~/.tmux.conf
```

