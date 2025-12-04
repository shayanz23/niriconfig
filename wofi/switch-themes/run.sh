#!/run/current-system/sw/bin/bash

if pgrep -x "wofi" > /dev/null
then
    pkill -x "wofi"
else
    ~/.config/wofi/switch-themes/list-themes.sh | wofi -S dmenu --allow-images --insensitive -p "themes" | ~/.config/themes/set-themes.sh
    ~/.config/wofi/switch-themes/list-colors.sh | wofi -S dmenu --allow-images --insensitive -p "colors" | ~/.config/themes/set-colors.sh
fi
