function re --wraps='sudo pacman -Rns' --description 'alias re=sudo pacman -Rns'
    sudo pacman -Rns $argv
end
