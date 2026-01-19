mkdir -p ~/Pictures/blurredBackgrounds

find ~/Pictures/backgrounds/ -type f | while read -r file; do
    name=$(basename "$file")
    output=~/Pictures/blurredBackgrounds/"${name%.*}.png"
    
    if [[ ! -f "$output" ]]; then
        echo "Generating: $name"
        magick "$file" -blur 0x20 "$output" &
    fi
done

wait
echo "Done!"