#!/usr/bin/env fish
if test -e "./Python-3.9.18.tgz"
    tar -xvf Python-3.9.18.tgz
    cd Python-3.9.18
    ./configure --prefix=/opt/Python3/python3.9 --enable-shared --enable-optimizations
    make
    sudo make install
    sudo cp /opt/Python3/python3.9/lib/libpython3.9.so.1.0 /usr/lib/
    sudo cp /opt/Python3/python3.9/lib/libpython3.9.so.1.0 /usr/lib64/
    sudo ln -s /opt/Python3/python3.9/bin/python3.9 /usr/bin/python3.9
    sudo ln -s /opt/Python3/python3.9/bin/pip3.9 /usr/bin/pip3.9
end
