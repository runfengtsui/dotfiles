if status is-interactive
    # Commands to run in interactive sessions can go here
    alias vi="nvim"
    alias vim="nvim"
    alias julia="julia --threads 8"
    alias dl="aria2c -s16 -x16 -k1M"
    # path of xmake and poetry
    set -x PATH $HOME/.local/bin $PATH
    # path of Julia and juliaup
    set -x PATH $HOME/.juliaup/bin $PATH
    # path of nodejs and npm
    set -x PATH $HOME/.local/share/fnm/aliases/default/bin $PATH
    set -x EDITOR nvim
    # qt.qpa.plugin: Could not find the Qt platform plugin "dxcb" in ""
    # https://bbs.deepin.org/zh/post/271930
    set -x QT_QPA_PLATFORM xcb
end
