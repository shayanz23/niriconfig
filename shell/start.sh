#!/bin/bash

if pgrep -x "gjs" > /dev/null
then
    pkill -x "gjs"
fi
# waybar -c /home/human/niriconfig/waybar/config.jsonc -s /home/human/niriconfig/waybar/style-output.css
# /home/human/Projects/Waybar/build/waybar -c /home/human/niriconfig/waybar/config.jsonc -s /home/human/niriconfig/waybar/style-output.css
# ags run /home/human/niriconfig/shell/app.ts
if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    if [ "$NAME" = "NixOS" ]; then
        my-gnome-shell
    else
        ags run /home/human/niriconfig/shell/app.ts
    fi
fi