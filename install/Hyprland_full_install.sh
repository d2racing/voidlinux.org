#!/bin/sh

echo "=== Hyprland Full Install on Void Linux ==="

# Update system
sudo xbps-install -Syu

# Install seatd and enable service
sudo xbps-install -y seatd
sudo ln -s /etc/sv/seatd /var/service/ 2>/dev/null
sudo usermod -aG seatd $USER

# Install Hyprland and core packages
sudo xbps-install -y hyprland \
  waybar \
  wofi \
  hyprpaper \
  hypridle \
  hyprlock \
  foot \
  grim slurp \
  wl-clipboard \
  xdg-desktop-portal \
  xdg-desktop-portal-wlr

# Create config directories
mkdir -p ~/.config/hypr
mkdir -p ~/.config/waybar
mkdir -p ~/.config/wofi
mkdir -p ~/.config/hyprpaper

# Copy default Hyprland config
if [ -f /etc/xdg/hypr/hyprland.conf ]; then
  cp /etc/xdg/hypr/hyprland.conf ~/.config/hypr/.
fi

# Create minimal working Hyprland config
cat > ~/.config/hypr/hyprland.conf << 'EOF'
monitor=,preferred,auto,1

exec-once = waybar &
exec-once = hyprpaper &
exec-once = hypridle &

env = XDG_SESSION_TYPE,wayland
env = XDG_CURRENT_DESKTOP,Hyprland

# Basic bindings
bind = SUPER, Return, exec, foot
bind = SUPER, Q, killactive,
bind = SUPER, SPACE, exec, wofi --show drun
bind = SUPER, F, fullscreen,
EOF

# Default wallpaper config
echo "preload = ~/Pictures/wallpaper.jpg" > ~/.config/hyprpaper/hyprpaper.conf
echo "wallpaper = ,~/Pictures/wallpaper.jpg" >> ~/.config/hyprpaper/hyprpaper.conf

# Basic Waybar config
cat > ~/.config/waybar/config << 'EOF'
{
  "layer": "top",
  "position": "top",
  "modules-left": ["clock"],
  "modules-center": [],
  "modules-right": ["cpu", "memory", "battery"]
}
EOF

echo "=== Installation complete ==="
echo "Log out and log back in, then start Hyprland with: seatd-launch Hyprland"
