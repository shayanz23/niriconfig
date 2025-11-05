function se --wraps='pacman -Ss' --description 'alias se=pacman -Ss'
    pacman -Ss $argv
end
