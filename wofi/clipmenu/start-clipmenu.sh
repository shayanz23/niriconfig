#!/run/current-system/sw/bin/bash

if pgrep -x "wofi" > /dev/null
then
    pkill -x "wofi"
else
    cliphist list | wofi -S dmenu --allow-images --insensitive -p "clipboard" | cliphist decode | wl-copy
fi