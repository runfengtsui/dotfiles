#!/usr/bin/env python3
import os
from widgets import Workspace

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
print(active_list)

gaps = Workspace.inner_gap * " "
output = gaps

for i in range(num):
    if i == current:
        output = f"{output}{'%{F#'}{Workspace.focus}{'}%{B#'}{Workspace.background}{'}'}{i+1}{gaps}"
    elif i in active_list:
        output = f"{output}{'%{F#'}{Workspace.occupied}{'}%{B#'}{Workspace.background}{'}'}{i+1}{gaps}"
    else:
        output = f"{output}{'%{F#'}{Workspace.foreground}{'}%{B#'}{Workspace.background}{'}'}{i+1}{gaps}"

print(output)
