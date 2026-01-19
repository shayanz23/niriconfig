#!/usr/bin/fish
read -l piped_data

echo $piped_data

if [ "$piped_data" = "purple" ]
    pkexec papirus-folders -C violet
    cp -f ~/.config/themes/colors/$piped_data/color.scss ~/.config/themes/color.scss
    cp -f ~/.config/themes/colors/$piped_data/color.kdl ~/.config/niri/color.kdl
    gsettings set org.gnome.desktop.interface accent-color $piped_data
else if [ "$piped_data" = "green" ]
    pkexec papirus-folders -C $piped_data
    cp -f ~/.config/themes/colors/$piped_data/color.scss ~/.config/themes/color.scss
    cp -f ~/.config/themes/colors/$piped_data/color.kdl ~/.config/niri/color.kdl
    gsettings set org.gnome.desktop.interface accent-color $piped_data
    ./set-folders.sh green
else if [ "$piped_data" = "red" ]
    pkexec papirus-folders -C $piped_data
    cp -f ~/.config/themes/colors/$piped_data/color.scss ~/.config/themes/color.scss
    cp -f ~/.config/themes/colors/$piped_data/color.kdl ~/.config/niri/color.kdl
    gsettings set org.gnome.desktop.interface accent-color $piped_data
else if [ "$piped_data" = "blue" ]
    pkexec papirus-folders -C $piped_data
    cp -f ~/.config/themes/colors/$piped_data/color.scss ~/.config/themes/color.scss
    cp -f ~/.config/themes/colors/$piped_data/color.kdl ~/.config/niri/color.kdl
    gsettings set org.gnome.desktop.interface accent-color $piped_data
else if [ "$piped_data" = "cyan" ]
    pkexec papirus-folders -C $piped_data
    cp -f ~/.config/themes/colors/$piped_data/color.scss ~/.config/themes/color.scss
    cp -f ~/.config/themes/colors/$piped_data/color.kdl ~/.config/niri/color.kdl
    gsettings set org.gnome.desktop.interface accent-color teal
else if [ "$piped_data" = "yellow" ]
    pkexec papirus-folders -C $piped_data
    cp -f ~/.config/themes/colors/$piped_data/color.scss ~/.config/themes/color.scss
    cp -f ~/.config/themes/colors/$piped_data/color.kdl ~/.config/niri/color.kdl
    gsettings set org.gnome.desktop.interface accent-color $piped_data
else if [ "$piped_data" = "orange" ]
    pkexec papirus-folders -C $piped_data
    cp -f ~/.config/themes/colors/$piped_data/color.scss ~/.config/themes/color.scss
    cp -f ~/.config/themes/colors/$piped_data/color.kdl ~/.config/niri/color.kdl
    gsettings set org.gnome.desktop.interface accent-color $piped_data
else
    echo "invalid option."
    exit 1
end

sass ~/.config/rofi/config.scss ~/.config/rofi/config.rasi
sass ~/.config/wofi/style.scss ~/.config/wofi/style.css
nohup bash ~/.config/waybar/startwaybar.sh &