#!/run/current-system/sw/bin/bash

if pgrep -x "rofi" > /dev/null
then
    pkill -x "rofi"
else
    rofi -show drun
fi
