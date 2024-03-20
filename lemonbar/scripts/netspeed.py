#!/usr/bin/env python3
import os
import time
import sys

def get_down_speed():
    down_before = float(os.popen("cat /proc/net/dev | grep wlp5s0 | awk '{print $2}'").read())
    time.sleep(1)
    down_after = float(os.popen("cat /proc/net/dev | grep wlp5s0 | awk '{print $2}'").read())
    down = (down_after - down_before) / 1024 / 1024
    return down

while True:
    output = f"  {get_down_speed():.2f}Mb/s"
    sys.stdout.write(output)
    sys.stdout.flush()
    time.sleep(1)

