#!/usr/bin/env fish
# Create the local fonts directory
mkdir -p ~/.local/share/fonts
# Download FiraCode.zip file
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraCode.zip

if test -f FiraCode.zip
    # If file is successfully downloaded
    sudo unzip FiraCode.zip -d ~/.local/share/fonts/FiraCode
    # Remove the cache file
    rm FiraCide.zip
    # Create cache files for FiraCode fonts
    cd ~/.local/share/fonts/FiraCode
    fc-cache -fv
else
    # If there is an error
    echo "Download Error! Please setup the network and then retry!"
end
