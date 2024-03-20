#!/usr/bin/env python3
import runpath
import time
import sys


while True:
    current_time = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())
    sys.stdout.write(current_time)
    sys.stdout.flush()
    time.sleep(1)

