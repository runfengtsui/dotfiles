#!/usr/bin/env fish
# update VERSION if nodejs update
set VERSION v20.11.1
# modify DISTRO for ARM
set DISTRO linux-x64

wget https://nodejs.org/dist/$VERSION/node-$VERSION-$DISTRO.tar.xz
sudo mkdir -p /usr/local/lib/nodejs
sudo tar -xJvf node-$VERSION-$DISTRO.tar.xz -C /usr/local/lib/nodejs 
rm node-$VERSION-$DISTRO.tar.xz
