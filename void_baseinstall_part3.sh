#!/bin/bash
echo "start of void_baseinstall_part3"

xbps-reconfigure -f glibc-locales
xbps-install -Syv poppler-data qt5-translations qt6-translations firefox-i18n-fr thunderbird-i18n-fr aspell-fr hunspell-fr_FR libreoffice-i18n-fr manpages-fr 
xbps-install -Syv gpm htop inxi neofetch git gnome-keyring rtkit libarchive tar xz p7zip unzip zip gzip lz4 lzo zstd linux-firmware linux-firmware-network cpupower spectre-meltdown-checker \
chrony cronie firefox firefox-i18n-fr polkit polkit-gnome tlp tracker tty-clock Thunar xbps octoxbps dbus dhcpcd NetworkManager xdg-desktop-portal xorg libinput libinput-gestures

echo "end of void_baseinstall_part3"
