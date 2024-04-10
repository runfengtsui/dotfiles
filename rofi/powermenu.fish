#!/usr/bin/env fish

switch $argv
case Poweroff
    echo Yes!
    echo No!
case Lock
    i3lock
    # i3lock --color "1E2E2E"
    # i3lock-fancy -g "1E2E2E"
case Reboot
    reboot
case Sleep
    systemctl suspend
case Yes!
    poweroff
case No!
    return
case Cancel
    return
case '*'
    echo Poweroff
    echo Lock
    echo Reboot
    echo Sleep
    echo Cancel
end

