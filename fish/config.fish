if status is-interactive
    # Commands to run in interactive sessions can go here
    alias vi="nvim"
    alias vim="nvim"
    alias dl="aria2c -s16 -x16 -k1M"
    alias baltam="/opt/Baltamatica/bin/baltamaticaC.sh"
    set -x PATH ~/.local/bin $PATH
    set -x EDITOR nvim
end
