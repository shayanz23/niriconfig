#!/bin/bash
sass ~/.config/waybar/style.scss ~/.config/waybar/style.css

if pgrep -x "waybar" > /dev/null
then
    pkill "waybar"
fi

waybar 