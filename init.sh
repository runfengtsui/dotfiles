#!/usr/bin/env bash
# path of dotfiles
CONFIG_PATH=$PWD

# NerdFonts
# wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip
# Install NerdFonts
cp $CONFIG_PATH/FiraCode/FiraCodeNerdFont-*.ttf /usr/share/fonts/
cd /usr/share/fonts
sudo mkfontscale
sudo mkfontdir
fc-cache -fv
cd $CONFIG_PATH

# ranger with highlight
apt -y install ranger highlight
if [[ -d $HOME/.config/ranger ]]; then
    rm -r $HOME/.config/ranger
fi
ln -s $CONFIG_PATH/ranger $HOME/.config/ranger

# build prerequisites
apt -y install ninja-build gettext cmake unzip curl
# NeoVim
cd $HOME/Documents/Repositories
git clone git@github.com:neovim/neovim.git
cd neovim; git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=/opt/nvim
make install
ln -s /opt/nvim/bin/nvim /usr/bin/nvim
# Packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
# npm to install Neovim's plugins
apt -y install npm
npm install n -g
n stable
# configuration for NeoVim
ln -s $CONFIG_PATH/nvim $HOME/.config/nvim
# remove vi, vim
apt -y remove vim vim-tiny vim-runtime vim-common

# xmake
curl -fsSL https://xmake.io/shget.text | bash

# Fish
apt install fish
# configuration for Fish Shell
if [[ -d $HOME/.config/fish ]]; then
    rm -r $HOME/.config/fish
fi
ln -s CONFIG_PATH/fish $HOME/.config/fish
# oh-my-fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install
fish install --path=~/.local/share/omf --config=~/.config/omf
# install Fish Shell theme Bobthefish
omf install bobthefish


# poetry
curl -sSL https://install.python-poetry.org | python3 -
# enable tab completion for Fish
# poetry completions fish > ~/.config/fish/commpletions/poetry.fish

# juliaup
curl -fsSL https://install.julialang.org | sh

# tree
apt -y install tree

# autoremove
apt autoremove

