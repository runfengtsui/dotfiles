#!/usr/bin/env bash

# git
sudo apt install git

# tree
sudo apt install tree

# ranger
sudo apt install ranger
# highlight
sudo apt install highlight

# Fish
sudo apt install fish
# configuration for Fish Shell
rm -r $HOME/.config/fish
sudo ln -s $PWD/fish $HOME/.config/fish

# xmake
curl -fsSL https://xmake.io/shget.text | bash

# poetry
curl -sSL https://install.python-poetry.org | python3 -
# enable tab completion for Fish
poetry completions fish > ~/.config/fish/commpletions/poetry.fish

