#!/run/current-system/sw/bin/bash
if pgrep -x "rofi" > /dev/null
then
    pkill -x "rofi"
else
    echo -e "suspend\nshutdown\nlogout\nrestart" | rofi -dmenu -p "power options" | bash ~/.config/rofi/powermenu/actions.sh
fi