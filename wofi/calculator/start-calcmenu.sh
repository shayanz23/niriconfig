#!/run/current-system/sw/bin/bash

if pgrep -x "wofi" > /dev/null
then
    pkill -x "wofi"
else
    wofi-calc
    sleep 2
    pkill -x "wofi"
fi