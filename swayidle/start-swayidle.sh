#!/bin/bash

kill swayidle

swayidle -w timeout 240 'notify-send Swaylock "Locking in 5 minutes." && brightnessctl -s set 10%' resume 'brightnessctl -r' timeout 420 'systemctl suspend' lock 'hyprlock' before-sleep 'hyprlock'