if status is-interactive
    # Commands to run in interactive sessions can go here
    alias vi="nvim"
    alias vim="nvim"
    alias dl="aria2c -s16 -x16 -k1M"
    # path of xmake and poetry
    set -x PATH $HOME/.local/bin $PATH
    # path of Julia and juliaup
    set -x PATH $HOME/.juliaup/bin $PATH
    # path of nodejs and npm
    set NODEVERSION v22.9.0
    set -x PATH $HOME/.local/share/fnm/node-versions/$NODEVERSION/installation/bin $PATH
    set -x EDITOR nvim
end
