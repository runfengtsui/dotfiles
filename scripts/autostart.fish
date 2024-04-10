#!/usr/bin/env fish

set runpath (cd (status dirname); pwd)

function clash
    killall clash-linux-amd64
    $HOME/clash-for-linux/start.sh
end


fcitx &
feh --randomize --bg-fill $HOME/dotfiles/Wallpapers/ &
compton &
$runpath/statusbar.py &
clash 

