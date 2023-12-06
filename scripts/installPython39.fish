#!/usr/bin/env fish
# Get the path of running the script
set runtime_path $PWD
# Download tgz file to install Python3.9
curl -R -O https://www.python.org/ftp/python/3.9.18/Python-3.9.18.tgz
if test -f "Python-3.9.18.tgz"
    # to import tkinter in Python3.9
    sudo apt install tk-dev
    tar -xvf Python-3.9.18.tgz
    cd Python-3.9.18
    ./configure --prefix=/opt/Python3/python3.9 --enable-shared --enable-optimizations
    make
    sudo make install
    sudo cp /opt/Python3/python3.9/lib/libpython3.9.so.1.0 /usr/lib/
    sudo cp /opt/Python3/python3.9/lib/libpython3.9.so.1.0 /usr/lib64/
    sudo ln -s /opt/Python3/python3.9/bin/python3.9 /usr/bin/python3.9
    sudo ln -s /opt/Python3/python3.9/bin/pip3.9 /usr/bin/pip3.9
    rm $runtime_path/Python-3.9.18.tgz
else
    echo "No tgz file for install Python3.9"
end
