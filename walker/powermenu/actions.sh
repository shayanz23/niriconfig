#!/bin/bash

read foo

echo $foo

if [ "$foo" = "suspend" ]; then
    systemctl suspend 
elif [ "$foo" = "shutdown" ]; then
    shutdown now
elif [ "$foo" = "logout" ]; then
    niri msg action quit
elif [ "$foo" = "restart" ]; then
    shutdown -r now
fi