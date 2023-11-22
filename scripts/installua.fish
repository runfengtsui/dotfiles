#! /usr/bin/env fish

# download tar install file for Lua
curl -R -O https://www.lua.org/ftp/lua-5.4.6.tar.gz
# install denpendences
sudo apt install libreadline-dev
# todo: regex to indentify version
if test -f "lua-5.4.6.tar.gz"
    tar zxf lua-5.4.6.tar.gz
    cd lua-5.4.6
    sudo make linux test
    sudo make install
    rm lua-5.4.6.tar.gz
else
    echo "No tar file for installing Lua!"
end
