#!/bin/bash
echo "start of void_baseinstall_part6"

# echo 'repository=https://github.com/void-land/hyprland-void-packages-testing/releases/latest/download/' | sudo tee /etc/xbps.d/hyprland-packages.conf
echo 'repository=https://raw.githubusercontent.com/Makrennel/hyprland-void/repository-x86_64-glibc' | sudo tee /etc/xbps.d/hyprland-packages.conf
xbps-install -S
xbps-install -Sy hyprland hyprland-devel aquamarine hyprcursor hypridle hyprland-protocols hyprlang hyprlock hyprpaper hyprutils hyprwayland-scanner xdg-desktop-portal-hyprland seatd elogind
xbps-install -Sy xdg-desktop-portal xdg-desktop-portal-wlr

ln -s /etc/sv/dbus /var/service/
ln -s /etc/sv/elogind /var/service/
ln -s /etc/sv/pipewire /var/service/
ln -s /etc/sv/pipewire-pulse /var/service/
ln -s /etc/sv/wireplumber /var/service/

