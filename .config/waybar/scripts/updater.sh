#!/bin/bash

# https://github.com/speltriao/Pacman-Update-for-GNOME-Shell

AUR=$(yay -Qua | wc -l)
OFFICIAL=$(checkupdates | wc -l)

case $1 in
    aur) echo "$AUR updates";;
    official) echo "$OFFICIAL updates";;
esac

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

if [ "$1" = "update" ]; then
    kitty sh -c 'yay -Syu'
    notify-send "System updated"

    # Purge yay/pacman old caches and orphans
    yay -Sc
    sudo pacman -Rns $(pacman -Qdtq)
    sudo paccache -r
    notify-send "System cleaned"

    # Check if a reboot might be required
    kernel_updated=[[ $(uname -r) != $(file /boot/vmlinuz-linux | cut -d ' ' -f 5-6) ]]
    systemd_updated=[ -f /usr/lib/systemd/systemd ] && [ /usr/lib/systemd/systemd -nt /proc/1/exe ]
    if $kernel_updated || $systemd_updated; then
        notify-send "Reboot needed"
    fi
fi
