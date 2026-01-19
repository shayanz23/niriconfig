#!/bin/bash

if pgrep -x "qs" > /dev/null
then
    pkill "qs"
fi

qs 