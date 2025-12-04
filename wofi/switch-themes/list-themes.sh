#!/usr/bin/fish

set target_dir ~/.config/themes/themes


# List all directories
for dir in $target_dir/*/
    echo (basename $dir)
end