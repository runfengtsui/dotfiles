import os
from config import Config
from widgets import Workspace
import math

with os.popen("xdotool getmouselocation | cut -d ' ' -f 1 | cut -c 3-", "r") as pipe:
    mouse_x = int(pipe.read())

x = Config.outer_gap + Workspace.inner_gap * Config.font_size * 1.5 / 2
width = (2 * Workspace.inner_gap + Workspace.length) * (Config.font_size * 1.5)

ave = width * 2 / (Workspace.length - 1)
clicked = math.ceil((mouse_x - x) / ave)
if clicked > 0 and clicked <= (Workspace.length - 1) / 2:
    print(clicked - 1)

