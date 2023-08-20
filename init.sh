#!/usr/bin/env bash
# path of dotfiles
CONFIG_PATH=$HOME/dotfiles

# NerdFonts
# wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip
# Install NerdFonts
if [[ ! -f /usr/share/fonts/FiraCodeNerdFont-Regular.ttf ]]; then
    sudo cp $CONFIG_PATH/FiraCode/FiraCodeNerdFont-*.ttf /usr/share/fonts/
    cd /usr/share/fonts
    sudo mkfontscale
    sudo mkfontdir
    sudo fc-cache -fv
    cd $CONFIG_PATH
else
    echo "FiraCodeNerdFont have been installed!"
fi

# ranger with highlight
if ! command -v ranger >/dev/null 2>&1; then
    sudo apt -y install ranger highlight
    if [[ -d $HOME/.config/ranger ]]; then
        rm -r $HOME/.config/ranger
    fi
    ln -s $CONFIG_PATH/ranger $HOME/.config/ranger
else
    echo "ranger has been installed!"
fi

# build prerequisites
sudo apt -y install ninja-build gettext cmake unzip curl
# NeoVim
if [[ ! -d $HOME/Documents/Repositories/neovim ]]; then
    git clone git@github.com:neovim/neovim.git $HOME/Documents/Repositories/neovim
else
    echo "neovim repository has been cloned!"
fi
if ! command -v nvim >/dev/null 2>&1; then
    cd $HOME/Documents/Repositories/neovim
    git checkout stable
    make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=/opt/nvim
    sudo make install
    if [[ -f /opt/nvim/bin/nvim ]]; then
        sudo ln -s /opt/nvim/bin/nvim /usr/bin/nvim
    fi
    if command -v nvim >/dev/null 2>&1; then
        # configuration for NeoVim
        ln -s $CONFIG_PATH/nvim $HOME/.config/nvim
    else
        echo "nvim install failed!"
    fi
else
    echo "nvim has been installed!"
fi
# remove vi, vim
if command -v nvim >/dev/null 2>&1; then
    sudo apt -y remove vim vim-tiny vim-runtime vim-common
fi
# npm to install Neovim's plugins
if ! command -v npm >/dev/null 2>&1; then
    sudo apt -y install npm
    sudo npm install n -g
    sudo n stable
else
    echo "npm and node have been installed!"
fi

# xmake
if ! command -v xmake >/dev/null 2>&1; then
    curl -fsSL https://xmake.io/shget.text | bash
else
    echo "xmake has been installed!"
fi

# Fish
sudo apt -y install fish
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
if ! command -v poetry >/dev/null 2>&1; then
    curl -sSL https://install.python-poetry.org | python3 -
else
    echo "poetry has been installed!"
fi
# enable tab completion for Fish
# poetry completions fish > ~/.config/fish/commpletions/poetry.fish

# juliaup
if ! command -v juliaup >/dev/null 2>&1; then
    curl -fsSL https://install.julialang.org | sh
else
    echo "juliaup has been installed!"
fi

# tree
sudo apt -y install tree

# autoremove
sudo apt -y autoremove

