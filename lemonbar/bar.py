#!/usr/bin/env python3
import os
from config import Config
from layout import Layout

x = Config.outer_gap
# for widget in Layout.left:
#     I = 0
#     width = (2 * widget.inner_gap + widget.length) * (Config.font_size * 1.5)

for widget in Layout.right:
    I = 0
    width = (2 * widget.inner_gap + widget.length) * (Config.font_size * 1.5)
    x = x - width

