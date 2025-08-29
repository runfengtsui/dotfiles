#!/usr/bin/env fish
# TODO: Parse parameters to get VERSION
# Version to be installed
set VERSION 3.4.0

# Download FiraCode.zip file
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v$VERSION/FiraCode.zip

# If file is successfully downloaded
if test -f FiraCode.zip
    # Create the local fonts directory
    mkdir -p ~/.local/share/fonts
    # Unzip it to fonts directory 
    unzip FiraCode.zip -d ~/.local/share/fonts/FiraCode
    # Remove the cache file
    rm FiraCode.zip
    # Create cache files for FiraCode fonts
    cd ~/.local/share/fonts/FiraCode
    fc-cache -fv
else
    # If there is an error
    echo "Download Error! Please setup the network and then retry!"
end
