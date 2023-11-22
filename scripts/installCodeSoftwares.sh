#!/usr/bin/env bash
# path of dotfiles
CONFIG_PATH=$HOME/dotfiles

# configurations for ranger
if [[ -d $HOME/.config/ranger ]]; then
    rm -r $HOME/.config/ranger
fi
ln -s $CONFIG_PATH/ranger $HOME/.config/ranger

# NeoVim
# wget https://github.com/neovim/neovim/releases/download/v0.9.4/nvim.appimage
if command -v nvim >/dev/null 2>&1; then
    # configuration for NeoVim
    ln -s $CONFIG_PATH/nvim $HOME/.config/nvim
else
    echo "NeoVim is not installed!"
fi
# remove vi, vim
if command -v nvim >/dev/null 2>&1; then
    sudo apt remove vim-common
    sudo apt autoremove
fi

# xmake
if ! command -v xmake >/dev/null 2>&1; then
    curl -fsSL https://xmake.io/shget.text | bash
else
    echo "xmake has been installed!"
fi

# oh-my-fish
if ! command -v omf >/dev/null 2>&1; then
    curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install
    fish install --path=~/.local/share/omf --config=~/.config/omf
    rm install
else
    echo "omf has been installed!"
fi
# install Fish Shell theme Bobthefish
if command -v omf >/dev/null 2>&1; then
    omf install bobthefish
    # configuration for Fish Shell
    if [[ -d $HOME/.config/fish ]]; then
        rm -r $HOME/.config/fish
    fi
    ln -s CONFIG_PATH/fish $HOME/.config/fish
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

