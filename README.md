### install
distro: archlinux
profile: desktop > hyprland
options: systemd, pipewire, network manager, multilib, git

### init wifi
nmcli device wifi connect <SSID> password <PASSWORD>

### init yay
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R <USER>:<USER> ./yay-git
cd yay-git && makepkg -si && cd .. && rm -rf yay-git
yay -Syu

### packages (yay -S <PACKAGE>)
kitty
hyprpaper
waybar
otf-font-awesome
pacman-contrib
neofetch
htop
wl-clipboard
bluez
bluez-utils
blueman-manager
pamixer
pavucontrol

### applications (yay -S <PACKAGE>)
microsoft-edge-stable-bin
visual-studio-code-bin
slack-desktop

### commands
systemctl enable NetworkManager
systemctl enable pipewire-pulse
systemctl enable bluetooth
