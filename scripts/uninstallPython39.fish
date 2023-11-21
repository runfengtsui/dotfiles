#!/usr/bin/env fish
if test -e "/usr/bin/python3.9"
    sudo rm /usr/bin/python3.9
end
if test -e "/usr/bin/pip3.9"
    sudo rm /usr/bin/pip3.9
end
if test -d "$HOME/.local/lib/python3.9"
    rm -r $HOME/.local/lib/python3.9/
end
if test -d "/opt/Python3/python3.9/"
    sudo rm -r /opt/Python3/python3.9/
end

