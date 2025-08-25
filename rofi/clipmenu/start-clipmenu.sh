#!/run/current-system/sw/bin/bash

if pgrep -x "rofi" > /dev/null
then
    pkill -x "rofi"
else
    cliphist list | rofi -dmenu -p "clipboard: " | cliphist decode | wl-copy
fi