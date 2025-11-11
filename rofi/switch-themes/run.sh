#!/run/current-system/sw/bin/bash

if pgrep -x "rofi" > /dev/null
then
    pkill -x "rofi"
else
    ~/.config/rofi/switch-themes/list-themes.sh | rofi -dmenu -p "themes" | ~/.config/themes/set-themes.sh
    ~/.config/rofi/switch-themes/list-colors.sh | rofi -dmenu -p "colors" | ~/.config/themes/set-colors.sh
fi
