#!/run/current-system/sw/bin/bash

if pgrep -x "rofi" > /dev/null
then
    pkill -x "rofi"
else
    ~/.config/rofi/switch-themes/list-themes.sh | rofi -dmenu -p "themes" | ~/.config/colors/set.sh
fi