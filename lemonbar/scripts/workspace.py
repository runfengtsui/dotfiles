#!/usr/bin/env python3
import os

# Get the current workspace
# os.popen return a file type
with os.popen("xdotool get_desktop", "r") as pipe:
    current = int(pipe.read())
# Get the number of workspaces
with os.popen("xdotool get_num_desktops", "r") as pipe:
    num = int(pipe.read())
# sudo apt install wmctrl - control an EWMH/NetWM compatible X Window Manager
with os.popen("wmctrl -l | awk '{print $2}'", "r") as pipe:
    get_active = pipe.read()
# rstrip method removes the space line and then split it with `\n`
active_list = get_active.rstrip().split('\n')

# for i in range(3):
#     if i == current:
#         output = output + f"%\{#\}"
# print(f"%{}")
focus = "000000"
background = "ffffff"
i = 0
gaps = 10
print(f"%{{F#{focus}}}%{{B#{background}}}{i+1}{gaps}")
