#!/usr/bin/env fish

# Get the path of running the script
set runpath (cd (status dirname); pwd)
# set Python version
set RELEASE 3.9.18
set VERSION 3.9


# Download tgz file
curl -R -O https://www.python.org/ftp/python/$RELEASE/Python-$RELEASE.tgz
if test -f Python-$RELEASE.tgz
    # to import tkinter
    sudo apt install tk-dev
    tar -xvf Python-$RELEASE.tgz
    cd Python-$RELEASE
    ./configure --prefix=/opt/python3/python$RELEASE --enable-shared --enable-optimizations
    make
    sudo make install
    sudo cp /opt/python3/python$RELEASE/lib/libpython$VERSION.so.1.0 /usr/lib/
    sudo cp /opt/python3/python$RELEASE/lib/libpython$VERSION.so.1.0 /usr/lib64/
    sudo ln -s /opt/python3/python$RELEASE/bin/python$VERSION /usr/bin/python$VERSION
    sudo ln -s /opt/python3/python$RELEASE/bin/pip$VERSION /usr/bin/pip$VERSION
    rm $runpath/Python-$RELEASE.tgz
else
    echo "No tgz file for install Python"
end
