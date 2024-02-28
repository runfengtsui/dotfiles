#!/usr/bin/env bash
# path of dotfiles
CONFIG_PATH=$HOME/dotfiles

# export http_proxy and https_proxy
mkdir $HOME/.config/fish/functions
cp $CONFIG_PATH/fish/functions/proxy_on.fish $HOME/.config/fish/functions
proxy_on

# install yazi file manager
cargo install --locked yazi-fm

# NeoVim
# wget https://github.com/neovim/neovim/releases/download/v0.9.4/nvim.appimage
if [[ -d $HOME/.config/nvim ]]; then
    rm $HOME/.config/nvim
fi
# configuration for NeoVim
ln -s $CONFIG_PATH/nvim $HOME/.config/nvim

# xmake
if ! command -v xmake >/dev/null 2>&1; then
    curl -fsSL https://xmake.io/shget.text | bash
else
    echo "xmake has been installed!"
fi


# poetry
# if ! command -v poetry >/dev/null 2>&1; then
#     curl -sSL https://install.python-poetry.org | python3 -
# else
#     echo "poetry has been installed!"
# fi
# enable tab completion for Fish
# poetry completions fish > ~/.config/fish/commpletions/poetry.fish

# juliaup
if ! command -v juliaup >/dev/null 2>&1; then
    curl -fsSL https://install.julialang.org | sh
else
    echo "juliaup has been installed!"
fi

# config for fish
if [[ -d $HOME/.config/fish ]]; then
    rm -r $HOME/.config/fish
fi
ln -s CONFIG_PATH/fish $HOME/.config/fish

# install Rust package manager cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# remove vi, vim
if command -v nvim >/dev/null 2>&1; then
    sudo apt remove vim-common
    sudo apt autoremove
fi

