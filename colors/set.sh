#!/usr/bin/fish
read -l piped_data

# Get list of directories in themes folder
set themes (basename -a ~/.config/colors/themes/*/)

if contains $piped_data $themes
    cp -f ~/.config/colors/themes/$piped_data/_index.scss ~/.config/colors/_index.scss
else
    echo "invalid option."
    exit 1
end

nohup bash ~/.config/waybar/startwaybar.sh &