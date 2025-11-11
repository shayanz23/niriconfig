#!/usr/bin/fish
read -l piped_data

echo $piped_data

if [ "$piped_data" = "purple" ]
    cp -f ~/.config/themes/colors/$piped_data/color.scss ~/.config/themes/color.scss
    gsettings set org.gnome.desktop.interface accent-color '$piped_data'
    ./set-folders.sh $piped_data
else if [ "$piped_data" = "green" ]
    cp -f ~/.config/themes/colors/$piped_data/color.scss ~/.config/themes/color.scss
    gsettings set org.gnome.desktop.interface accent-color '$piped_data'
    ./set-folders.sh green
else if [ "$piped_data" = "red" ]
    cp -f ~/.config/themes/colors/$piped_data/color.scss ~/.config/themes/color.scss
    gsettings set org.gnome.desktop.interface accent-color '$piped_data'
    ./set-folders.sh $piped_data
else if [ "$piped_data" = "blue" ]
    cp -f ~/.config/themes/colors/$piped_data/color.scss ~/.config/themes/color.scss
    gsettings set org.gnome.desktop.interface accent-color '$piped_data'
    ./set-folders.sh $piped_data
else if [ "$piped_data" = "cyan" ]
    cp -f ~/.config/themes/colors/$piped_data/color.scss ~/.config/themes/color.scss
    gsettings set org.gnome.desktop.interface accent-color '$piped_data'
    ./set-folders.sh $piped_data
else
    echo "invalid option."
    exit 1
end

sass ~/.config/rofi/config.scss ~/.config/rofi/config.rasi
nohup bash ~/.config/waybar/startwaybar.sh &