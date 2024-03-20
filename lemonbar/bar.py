#!/usr/bin/env python3
import os
from layout import Layout

def drawbar(x, layout):
    for _, widget in enumerate(layout):
        position = f"{str(widget.width)}x27+{str(x)}+0"
        cmd = f"{widget.command} | lemonbar -f '{widget.font}' -F '{widget.foreground}' -B '{widget.background}' -g {position} -p &"
        x = x + widget.width + widget.gap
        print(f"{x} {cmd}")
        os.popen(cmd)

os.popen("killall lemonbar")

drawbar(0, Layout.left)
drawbar(587, Layout.center)
drawbar(1046, Layout.right)

