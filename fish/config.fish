if status is-interactive
    # Commands to run in interactive sessions can go here
    # alias vi="nvim"
    # alias vim="nvim"
    # set -x EDITOR nvim
    # alias dl="aria2c -s16 -x16 -k1M"
    set -x PATH $HOME/.local/bin $PATH
    # Opencode
    set -x PATH $HOME/.opencode/bin $PATH
    # Julia and juliaup
    # set -x PATH $HOME/.juliaup/bin $PATH
    # qt.qpa.plugin: Could not find the Qt platform plugin "dxcb" in ""
    # https://bbs.deepin.org/zh/post/271930
    set -x QT_QPA_PLATFORM xcb

    # Configurations for Termux PRoot-Distro
    if string match -q "*PRoot-Distro*" (uname -r)
        # GC heap initialization failed
        set -x DOTNET_GCHeapHardLimit 1C0000000
    end
end
