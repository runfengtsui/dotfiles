#! /usr/bin/env fish
# Get the path of running the script
set runtime_path $PWD
# Download tar.gz file to install Lua
curl -R -O https://www.lua.org/ftp/lua-5.4.6.tar.gz
# Install denpendency
sudo apt install libreadline-dev
# Todo: regex to indentify version
if test -f "lua-5.4.6.tar.gz"
    tar zxf lua-5.4.6.tar.gz
    cd lua-5.4.6
    sudo make linux test
    sudo make install
    rm $runtime_path/lua-5.4.6.tar.gz
else
    echo "No tar.gz file for installing Lua!"
end
