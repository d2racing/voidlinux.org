#!/bin/bash
echo "start of void_baseinstall_part5"

# Installer le Kernel 6.7 (Selon votre choix)

#xbps-query --regex -Rs '^linux[0-9.]+-[0-9._]+'
#xbps-install -Syv linux6.7


# Installer les dépendances

xbps-install -Syv alsa-plugins alsa-lib FAudio freetype libXft flex fluidsynth libfluidsynth libXrandr xrandr libldap mpg123 libmpg123 libXcomposite libXi libXinerama libXScrnSaver libopenal alsa-pipewire pipewire libjack-pipewire  \
mit-krb5 gnutls giflib gst-libav gst-plugins-ugly1 gst-plugins-bad1 gst-plugins-base1 gst-plugins-good1 gstreamer1 libpng v4l-utils vulkan-loader libgpg-error libjpeg-turbo libgcrypt ncurses ncurses-libs ocl-icd libxslt libva glu sqlite  \
gtk+3 libpulseaudio libnm gamemode libgamemode vkBasalt cabextract

# Installer Flatpak (Optionnel)

#xbps-install -Syv flatpak xdg-desktop-portal xdg-user-dirs xdg-utils
#flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#flatpak install flathub com.discordapp.Discord

# Installer Discord (Optionnel)

#xbps-install -Syv git xtools
#git clone https://github.com/void-linux/void-packages
#cd void-packages
#./xbps-src binary-bootstrap
#echo XBPS_ALLOW_RESTRICTED=yes >> etc/conf
#./xbps-src pkg discord
#xi discord

# Installer des logiciels utiles

#backup :  borg

echo "end of void_baseinstall_part5"
