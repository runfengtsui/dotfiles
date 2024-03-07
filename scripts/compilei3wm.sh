#! /usr/bin/env bash
# install meson build system, ninja installed automacally
sudo apt install meson
# runtime dependencies
sudo apt install libstartup-notification0-dev
sudo apt install libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-shape0-dev libxcb-util-dev libxcb-cursor-dev libxcb-keysyms1-dev libxcb-icccm4-dev libxcb-xrm-dev
sudo apt install libxkbcommon-x11-dev libyajl-dev libcairo2-dev libpango1.0-dev libev-dev
sudo apt install i3lock rofi

mkdir -p build && cd build
meson ..
ninja

