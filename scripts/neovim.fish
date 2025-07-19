#!/usr/bin/env fish
# Download neovim tar file
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux-arm64.tar.gz

if test -f nvim-linux-arm64.tar.gz
    # If the file is downloaded successfully
    tar -zxvf nvim-linux-arm64.tar.gz
    # Remove the cache file
    rm nvim-linux-arm64.tar.gz
    # Install NeoVim to /otp/
    mv nvim-linux-arm64 /opt/
    # Create symbolic link to nvim
    ln -s /opt/nvim-linux-arm64/bin/nvim /usr/local/bin/nvim
else
    # Error when downloading
    echo "Download Error! Please setup the network and then retry!"
end
