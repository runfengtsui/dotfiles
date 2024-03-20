#!/usr/bin/env python3
import runpath
import os
import sys
import time

while True:
# for _ in range(5):
    # Get the current workspace
    # os.popen return a file type
    with os.popen("xdotool get_desktop", "r") as pipe:
        current_workspace = int(pipe.read())
    # Get the number of workspaces
    with os.popen("xdotool get_num_desktops", "r") as pipe:
        num = int(pipe.read())
    # sudo apt install wmctrl - control an EWMH/NetWM compatible X Window Manager
    # with os.popen("wmctrl -l | awk '{print $2}'", "r") as pipe:
    #     get_active = pipe.read()
    # rstrip method removes the space line and then split it with `\n`
    # active_list = get_active.rstrip().split('\n')

    gaps = " "
    output = ""
    for i in range(9):
        if i == current_workspace:
            output += f"{'%{F#F5C2E7}'}{gaps+'%{+u}'}{i+1}{'%{-u}'+gaps+'%{F}'}"
        else:
            output += gaps + str(i+1) + gaps

    sys.stdout.write(output)
    sys.stdout.flush()
    time.sleep(0.1)

