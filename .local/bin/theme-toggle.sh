#!/usr/bin/env bash

MODE_FILE="$HOME/.config/themes/current_mode"
THEME_DIR="$HOME/.config/themes"

# Get actual mode
MODE="light"
[[ -f "$MODE_FILE" ]] && MODE=$(<"$MODE_FILE")

# Switch
if [[ "$MODE" == "light" ]]; then
    NEW_MODE="dark"
else
    NEW_MODE="light"
fi

# Apply GTK 3.0 and GTK 4.0 themes
if [[ "$NEW_MODE" == "light" ]]; then
    gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3'
    gsettings set org.gnome.desktop.interface color-scheme 'default'
else
    gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark'
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
fi

ln -sf "$THEME_DIR/$NEW_MODE/gtk.ini" "$HOME/.config/gtk-3.0/settings.ini"
ln -sf "$THEME_DIR/$NEW_MODE/gtk.ini" "$HOME/.config/gtk-4.0/settings.ini"

# Apply waybar theme
ln -sf "$THEME_DIR/$NEW_MODE/waybar.css" "$HOME/.config/waybar/theme.css"

# Apply mako theme
ln -sf "$THEME_DIR/$NEW_MODE/mako" "$HOME/.config/mako/config"

# Apply wofi theme
ln -sf "$THEME_DIR/$NEW_MODE/wofi.css" "$HOME/.config/wofi/style.css"

# Apply alacritty theme
ln -sf "$THEME_DIR/$NEW_MODE/alacritty.toml" "$HOME/.config/alacritty/theme.toml"

# Apply bat theme
ln -sf "$THEME_DIR/$NEW_MODE/bat" "$HOME/.config/bat/config"

# Apply sway theme
ln -sf "$THEME_DIR/$NEW_MODE/sway.conf" "$HOME/.config/sway/theme.conf"

# Restart everthing
pkill mako ; pkill waybar ; swaymsg reload ; mako &

# Save the new mode
echo "$NEW_MODE" > "$MODE_FILE"

# Notify
notify-send "Thème activé : $NEW_MODE"

