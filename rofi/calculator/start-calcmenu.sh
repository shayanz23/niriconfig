#!/run/current-system/sw/bin/bash

if pgrep -x "rofi" > /dev/null
then
    pkill -x "rofi"
else
    rofi -show calc -modi calc -no-show-match -no-sort -calc-command "wl-copy '{result}'"
fi