#!/bin/bash
echo "start of void_baseinstall_part5"

# Installer le Kernel 6.7 (Selon votre choix)

#xbps-query --regex -Rs '^linux[0-9.]+-[0-9._]+'
#xbps-install -Syv linux6.7


# Installer les dépendances

xbps-install -Syv alsa-plugins alsa-plugins-32bit alsa-lib alsa-lib-32bit \
FAudio FAudio-32bit \
freetype freetype-32bit \
libXft libXft-32bit \
flex \
fluidsynth libfluidsynth libfluidsynth-32bit \
libXrandr libXrandr-32bit xrandr \
libldap libldap-32bit \
mpg123 libmpg123 libmpg123-32bit \
libXcomposite libXcomposite-32bit \
libXi libXi-32bit \
libXinerama libXinerama-32bit \
libXScrnSaver libXScrnSaver-32bit \
libopenal libopenal-32bit \
alsa-pipewire alsa-pipewire-32bit pipewire pipewire-32bit libjack-pipewire libjack-pipewire-32bit \
mit-krb5 mit-krb5-32bit \
gnutls gnutls-32bit \
giflib giflib-32bit \
gst-libav gst-plugins-ugly1 \
gst-plugins-bad1 gst-plugins-bad1-32bit \
gst-plugins-base1 gst-plugins-base1-32bit \
gst-plugins-good1 gst-plugins-good1-32bit \
gstreamer1 gstreamer1-32bit \
libpng libpng-32bit \
v4l-utils v4l-utils-32bit \
vulkan-loader vulkan-loader-32bit \
libgpg-error libgpg-error-32bit \
libjpeg-turbo libjpeg-turbo-32bit \
libgcrypt libgcrypt-32bit \
ncurses ncurses-libs ncurses-libs-32bit \
ocl-icd ocl-icd-32bit \
libxslt libxslt-32bit \
libva libva-32bit \
glu glu-32bit \
sqlite sqlite-32bit \
gtk+3 gtk+3-32bit \
libpulseaudio libpulseaudio-32bit \
libnm libnm-32bit \
gamemode libgamemode libgamemode-32bit \
vkBasalt vkBasalt-32bit \
cabextract

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
