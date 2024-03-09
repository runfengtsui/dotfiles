#! /usr/bin/env fish

set runpath (cd (status dirname); pwd)
set VERSION 4.23

# install meson build system, ninja installed automacally
sudo apt install meson
# runtime dependencies
sudo apt install libstartup-notification0-dev libxkbcommon-x11-dev libyajl-dev libcairo2-dev libpango1.0-dev libev-dev libpcre2-dev
sudo apt install libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-shape0-dev libxcb-util-dev libxcb-cursor-dev libxcb-keysyms1-dev libxcb-icccm4-dev libxcb-xrm-dev
sudo apt install i3lock rofi

# download release
if test ! -f $runpath/i3-$VERSION.tar.xz
    wget https://i3wm.org/downloads/i3-$VERSION.tar.xz
end
# tar -xf tar.xz
tar -xf i3-$VERSION.tar.xz
# build
if test -d i3-$VERSION
    mkdir -p i3-$VERSION/build && cd i3-$VERSION/build
    meson ..
    ninja
else
    echo "Error! Cound not find i3-$VERSION directory! Please retry download it!"
end

# delete i3-wm tar.xz release
rm $runpath/i3-$VERSION.tar.xz

