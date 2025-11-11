#!/usr/bin/fish
read -l piped_data

echo $piped_data

if [ "$piped_data" = "light" ]
    cp -f ~/.config/themes/themes/$piped_data/_index.scss ~/.config/themes/_index.scss
else if [ "$piped_data" = "dark" ]
    cp -f ~/.config/themes/themes/$piped_data/_index.scss ~/.config/themes/_index.scss
else
    echo "invalid option."
end