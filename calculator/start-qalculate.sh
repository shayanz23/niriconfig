#!/run/current-system/sw/bin/bash

if pgrep -x "qalculate-gtk" > /dev/null
then
    pkill -x "qalculate-gtk"
else
    qalculate-gtk
fi