#!/bin/bash

if ! pgrep -x "rofi" > /dev/null
then
    rofi -show window
fi
