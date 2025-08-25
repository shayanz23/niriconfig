#!/run/current-system/sw/bin/bash
sass /home/human/niriconfig/waybar/style.scss /home/human/niriconfig/waybar/style-output.css

if pgrep -x ".waybar-wrapped" > /dev/null
then
    pkill ".waybar-wrapped"
fi
# waybar -c /home/human/niriconfig/waybar/config.jsonc -s /home/human/niriconfig/waybar/style-output.css
# /home/human/Projects/Waybar/build/waybar -c /home/human/niriconfig/waybar/config.jsonc -s /home/human/niriconfig/waybar/style-output.css
waybar -c /home/human/niriconfig/waybar/config.jsonc -s /home/human/niriconfig/waybar/style-output.css