#!/run/current-system/sw/bin/bash

if pgrep -x "wofi" > /dev/null
then
    pkill -x "wofi"
else
    cliphist list | wofi --dmenu -p "clipboard: " | cliphist decode | wl-copy
fi