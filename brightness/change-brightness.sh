#!/run/current-system/sw/bin/bash

amount=$1

echo $(swayosd-client --brightness $amount)

brightnessctl get | tee ~/.config/brightness/brightness-level