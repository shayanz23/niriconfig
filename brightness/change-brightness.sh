#!/run/current-system/sw/bin/bash

amount=$1

echo $(swayosd-client --brightness $amount)

brightnessctl get | tee ~/nixconfig/brightness/brightness-level