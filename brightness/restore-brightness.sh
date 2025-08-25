#!/run/current-system/sw/bin/bash

previous=$(cat /home/human/niriconfig/brightness/brightness-level)

brightnessctl set $previous