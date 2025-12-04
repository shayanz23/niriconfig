#!/run/current-system/sw/bin/bash
if pgrep -x "wofi" > /dev/null
then
    pkill -x "wofi"
else
    echo -e "suspend\nshutdown\nlogout\nrestart" | wofi -S dmenu --allow-images --insensitive -p "power options" | bash ~/.config/wofi/powermenu/actions.sh
fi