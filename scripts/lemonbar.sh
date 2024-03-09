#!/usr/bin/env bash
killall lemonbar
python3 $HOME/dotfiles/lemonbar/bar.py | lemonbar -p -f "FiraCode"-12
