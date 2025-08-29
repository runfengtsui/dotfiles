#!/usr/bin/env fish
# TODO: Parse parameters to get VERSION
# Version to be installed
set VERSION 1.10.10
set ARCH $(uname -m)

# Download julia portable binary tarball
curl -LO https://julialang-s3.julialang.org/bin/linux/x64/1.10/julia-$VERSION-linux-$ARCH.tar.gz

# If file is successfully downloaded
if test -f julia-$VERSION-linux-$ARCH.tar.gz
    # Unzip it to fonts directory 
    sudo tar -xzvf julia-$VERSION-linux-$ARCH.tar.gz -C /opt/
    # Link the binary file to local binary directory
    sudo ln -s /opt/julia-$VERSION/bin/julia /usr/local/bin/julia
    # Remove the cache file
    rm julia-$VERSION-linux-$ARCH.tar.gz
else
    # If there is an error when downloading
    echo "Download Error! Please setup the network and then retry!"
end
