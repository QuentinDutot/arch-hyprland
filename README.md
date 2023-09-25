## Installation

**distro** : archlinux
**profile** : minimal
**options** : systemd, pipewire, network manager, git

### Init wifi

    nmcli device wifi connect <SSID> password <PASSWORD>

### Init yay

    cd /opt
    sudo git clone https://aur.archlinux.org/yay-git.git
    sudo chown -R <USER>:<USER> ./yay-git
    cd yay-git && makepkg -si && cd .. && sudo rm -rf yay-git
    yay -Syu

## Customization

### Packages

    yay -S sddm hyprland hyprpaper hyprshot kitty nano waybar otf-font-awesome pacman-contrib neofetch htop bluez bluez-utils blueman pamixer pavucontrol mako rofi

### Commands

    systemctl enable sddm
    systemctl enable NetworkManager
    systemctl enable bluetooth
    systemctl --user enable mako

### Configs

    cd ~
    git clone https://github.com/QuentinDutot/arch-hyprland
    cp -r arch-hyprland/.config/* .config/
    cp -r arch-hyprland/.icons .icons/
    rm -rf arch-hyprland

## More...

### Todos

 - file manager with nautilus
 - splash screen with plymouth
 - color picker with hyprpicker
 - check swaync for notifications
 - emoji picker with ?
 - customize hyprland window border
 - check systemd-boot for bootloader
 - replace grimblast with hyprshot
 - purge dunst as its installed with hyprland

### Issues

 - no custom cursor when hovering waybar
