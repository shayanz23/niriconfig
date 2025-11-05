#!/run/current-system/sw/bin/bash

previous=$(cat ~/nixconfig/brightness/brightness-level)

brightnessctl set $previous