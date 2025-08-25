#!/run/current-system/sw/bin/bash
if pgrep -x "rofi" > /dev/null
then
    pkill -x "rofi"
else
    echo "suspend|shutdown|logout|restart" | rofi -sep '|' -dmenu -p "power options: " | /home/human/niriconfig/rofi/powermenu/actions.sh
fi