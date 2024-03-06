if status is-interactive
    # Commands to run in interactive sessions can go here
    alias vi="nvim"
    alias vim="nvim"
    alias dl="aria2c -s16 -x16 -k1M"
    alias baltam="/opt/Baltamatica/bin/baltamaticaC.sh"
    # path of xmake and poetry
    set -x PATH $HOME/.local/bin $PATH
    # path of Julia and juliaup
    set -x PATH $HOME/.juliaup/bin $PATH
    # path of rustup and cargo
    set -x PATH $HOME/.cargo/bin $PATH
    # path of nodejs and npm
    set NODEVERSION v20.11.1
    set -x PATH /usr/local/lib/nodejs/node-$NODEVERSION-linux-x64/bin $PATH
    set -x EDITOR nvim
end
