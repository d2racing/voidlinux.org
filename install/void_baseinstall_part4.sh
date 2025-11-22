#!/bin/bash
echo "start of void_baseinstall_part4"

xbps-install -Syu sshd dbus chronyd cronie bluetoothd rtkit dhcpcd

# Installation des Services

ln -s /etc/sv/sshd /var/service/
ln -s /etc/sv/dbus /var/service/
# ln -s /etc/sv/NetworkManager /var/service/
ln -s /etc/sv/chronyd /var/service/
ln -s /etc/sv/cronie /var/service/
ln -s /etc/sv/bluetoothd /var/service/
ln -s /etc/sv/rtkit /var/service/
ln -s /var/lib/dbus/machine-id /etc/machine-id
ln -s /usr/share/applications/pipewire.desktop /etc/xdg/autostart/pipewire.desktop

xbps-install -Syv Waybar way-displays wayfire wayfire-plugins-extra wayland wayland-protocols wdisplays wlogout wlsunset wofi swayidle swaylock grim gammastep brightnessctl clipman dex elogind \
flatpak alacritty mako 

# Les Thèmes,fontes,icones, bref: L'apparence

xbps-install Adapta awoken-icons breeze-cursors cantarell-fonts console-setup font-awesome5 font-fira-otf grub-terminus gtkdatabox3 noto-fonts-cjk noto-fonts-emoji noto-fonts-ttf noto-fonts-ttf-extra nwg-launchers \
nwg-look paper-icon-theme

# Configuration des fontes une meilleure précision

rm /usr/share/fontconfig/conf.avail/70-yes-bitmaps.conf
ln -s /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/
xbps-reconfigure fontconfig

# Configuration de l'audio PulseAudio,Pipewire,WirePlumber

mkdir -p /etc/pipewire/pipewire.conf.d
ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/

xbps-install -Syu pavucontrol-qt playerctl pulseaudio pipewire alsa-pipewire wireplumber kanshi mpv mpv-mpris void-repo-multilib linux-firmware-amd mesa mesa-dri mesa-vdpau \
mesa-vaapi mesa-vulkan-radeon libva libva-vdpau-driver mesa-demos glxinfo xf86-video-amdgpu

echo "end of void_baseinstall_part4"
