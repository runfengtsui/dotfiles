import os

class Widget:
    def __init__(self, width, command, gap, font = "FiraCode Nerd Font", foreground = "#99ccff", background = "#000033") -> None:
        self.width = width
        self.command = command
        self.gap = gap
        self.font = font
        self.foreground = foreground
        self.background = background
    

runpath = os.path.dirname(os.path.realpath(__file__))
# widgets
workspace = Widget(270, f"{runpath}/scripts/workspace.py", 15)
time = Widget(190, f"{runpath}/scripts/time.py", 15)
netspeed = Widget(130, f"{runpath}/scripts/netspeed.py", 15)
volume = Widget(80, f"{runpath}/scripts/volume.py", 15)
battery = Widget(80, f"{runpath}/scripts/battery.py", 15)

# layout
class Layout:
    left = [workspace]
    center = [time]
    right = [netspeed, volume, battery]

