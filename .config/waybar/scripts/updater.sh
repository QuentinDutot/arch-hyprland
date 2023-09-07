#!/bin/bash

# https://github.com/speltriao/Pacman-Update-for-GNOME-Shell

# Calculate updates for each service
AUR=$(yay -Qua | wc -l)
OFFICIAL=$(checkupdates | wc -l)

# Case/switch for each service updates
case $1 in
    aur) echo "$AUR updates";;
    official) echo "$OFFICIAL updates";;
esac

# If the parameter is "check", return the count of updates
if [ "$1" = "check" ]; then
    # Calculate total number of updates
    COUNT=$((OFFICIAL+AUR))

    if [[ "$COUNT" = "0" ]]
    then
        echo ""
    else
        echo "$COUNT updates"
        notify-send "$COUNT updates available"
    fi
    exit 0
fi

# If the parameter is "update", update all services
if [ "$1" = "update" ]; then
    kitty sh -c 'yay -Syu'
    notify-send "System updated"
fi