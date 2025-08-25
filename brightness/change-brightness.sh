#!/run/current-system/sw/bin/bash

amount=$1

echo $(brightnessctl set $amount)

brightnessctl get | tee /home/human/niriconfig/brightness/brightness-level