#!/bin/bash
echo "start of void_baseinstall_part6"

echo 'repository=https://github.com/void-land/hyprland-void-packages-testing/releases/latest/download/' | sudo tee /etc/xbps.d/hyprland-packages.conf
xbps-install -S
xbps-install -Sy hyprland hyprland-devel aquamarine hyprcursor hypridle hyprland-protocols hyprlang hyprlock hyprpaper hyprutils hyprwayland-scanner xdg-desktop-portal-hyprland

