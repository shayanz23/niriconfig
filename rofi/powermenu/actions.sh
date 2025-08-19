read foo

echo $foo

if [ "$foo" = "suspend" ]; then
    hyprlock & sleep 2 && systemctl suspend 
elif [ "$foo" = "shutdown" ]; then
    shutdown now
elif [ "$foo" = "logout" ]; then
    niri msg action quit
elif [ "$foo" = "restart" ]; then
    shutdown -r now
fi