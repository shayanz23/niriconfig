#!/run/current-system/sw/bin/bash

if pgrep -x "wofi" > /dev/null
then
    pkill -x "wofi"
else
    wofi -S drun --allow-images --insensitive
fi
