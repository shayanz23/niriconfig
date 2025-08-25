#!/bin/bash


a=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed 's/[^0-9,.]*//g')

a="${a//[$'\t\r\n ']}"

echo $a

if (( $(echo "$a < 0.975" | bc -l) )); then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ "5%+"
fi