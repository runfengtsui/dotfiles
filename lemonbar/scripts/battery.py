#!/usr/bin/env python3
import runpath
import os
import sys
import time

# with os.popen("cat /sys/class/power_supply/BAT1/status") as pipe:
#     battery_status = pipe.read().rstrip('\n')
# set BAT (acpi -b | awk '{ print $4 " " $5 }' | tr -d ',')

def set_icon(capacity):
    if capacity > 80:
        icon = ""
    elif capacity > 60:
        icon = ""
    elif capacity > 40:
        icon = ""
    elif capacity > 20:
        icon = ""
    else:
        icon = ""
    return icon

while True:
    with os.popen("cat /sys/class/power_supply/BAT1/capacity") as pipe:
        capacity = int(pipe.read())
    icon = set_icon(capacity)
    output = f" {icon} {capacity}%"
    sys.stdout.write(output)
    sys.stdout.flush()
    time.sleep(10)

