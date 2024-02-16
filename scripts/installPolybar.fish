#!/usr/bin/env fish
# The following dependencies are only needed during compilation
sudo apt install python3-sphinx python3-packaging

# These are the hard dependencies, you cannot build or run polybar without them
sudo apt install libuv1-dev libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev

# These dependencies enable optional features in polybar, if they are installed during compilation.
sudo apt install libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev

# Building
git clone --recursive https://github.com/polybar/polybar
cd polybar

# Compiling
mkdir build
cd build
# In some circumstances the compilation might fail when using gcc
# and you will have to use clang to compile polybar.
cmake -DCMAKE_CXX_COMPILER="clang++" -DCMAKE_C_COMPILER="clang" ..
# If you are using bash/sh/zsh, the following command is
# make -j$(nproc)
make -j(nproc)
sudo make install

sudo apt remove python3-sphinx python3-packaging
sudo apt autoremove

