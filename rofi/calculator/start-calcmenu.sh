#!/bin/bash

if pgrep -x "rofi" > /dev/null
then
    pkill -x "rofi"
else
    rofi -show calc -modi calc -no-show-match -no-sort
fi