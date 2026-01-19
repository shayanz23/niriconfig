#!/bin/bash

mapfile -t files < <(find ~/Pictures/backgrounds/ -type f)

shuffle() {
    local i tmp size rand
    size=${#files[@]}
    for ((i=size-1; i>0; i--)); do
        rand=$((RANDOM % (i+1)))
        tmp="${files[i]}"
        files[i]="${files[rand]}"
        files[rand]="$tmp"
    done
}

while true
do
    shuffle
    for file in "${files[@]}"
    do
        name=$(basename "$file")
        blurred=~/Pictures/blurredBackgrounds/"${name%.*}.png"
        
        swww img -n workspace "$file" --transition-type wipe --transition-fps 165
        swww img -n workspaces "$blurred" --transition-type wipe --transition-fps 165 
        sleep 1000
    done
done