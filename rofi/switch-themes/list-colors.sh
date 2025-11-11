#!/usr/bin/fish

set target_dir ~/.config/themes/colors


# List all directories
for dir in $target_dir/*/
    echo (basename $dir)
end