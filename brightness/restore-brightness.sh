#!/run/current-system/sw/bin/bash

previous=$(cat ~/.config/brightness/brightness-level)

brightnessctl set $previous