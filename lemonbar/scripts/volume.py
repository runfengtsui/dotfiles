#!/usr/bin/env python3
import os
import sys
import time

def get_volume():
    with os.popen("amixer get Master | grep 'Front Left:' | awk '{print $5}' | tr -d '[]'") as pipe:
        vol = int(pipe.read().split('%')[0])

    return vol

def set_volume_icon(vol):
    if vol == 0:
        icon = ""
    elif vol > 60:
        icon = ""
    else:
        icon = ""

    return icon


while True:
    vol = get_volume()
    icon = set_volume_icon(vol)
    output = f" {icon} {vol}%"
    sys.stdout.write(output)
    sys.stdout.flush()
    time.sleep(0.5)

