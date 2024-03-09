import os

runpath = os.path.dirname(os.path.realpath(__file__))

# Get the number of workspaces
with os.popen("xdotool get_num_desktops", "r") as pipe:
    num = int(pipe.read())

blue = "89B4FA"
base = "1E1E2E"
pink = "F5C2E7",

class Date:
    foreground = blue
    background = base
    # action = {
    #     # sudo apt install calcurse
    #     "lclick": "alacritty -e calcurse"
    # }
    command = 'echo $(date "+%m.%d %a")'
    length = 12
    interval = 100
    inner_gap = 1

class Time:
    foreground = pink,
    background = base, 
    # action = {
    #     lclick = "alacritty tty-clock -s -c -C 5 -D",
    # },
    command = "echo \" $(date \"+%H:%M\")\"",
    len = 8,
    interval = 1,
    inner_gap = 1,

class Workspace:
    foreground = "585B70" # surface2
    background = base
    focus = "F5C2E7" # pink
    occupied = blue
    action = {
        "lclick": "xdotool set_desktop $(./switch-workspace.lua)",
        "rclick": "xdotool set_desktop_for_window $(xdotool getwindowfocus) $(lua ./switch-workspace)",
    }
    command = f"{runpath}/workspace.py"
    length = num + (num + 1) * 1
    interval = 0.1
    inner_gap = 2   # gap

