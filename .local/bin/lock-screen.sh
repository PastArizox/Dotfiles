#!/bin/bash

if pgrep -x swaylock >/dev/null 2>&1; then
    exit 0
fi

# ===========================================
#             CONFIGURATION
# ===========================================

# Chemin vers l'image de fond (laisser vide pour utiliser la capture d'écran)
MODE_FILE="$HOME/.config/themes/current_mode"
MODE="light"
[[ -f "$MODE_FILE" ]] && MODE=$(<"$MODE_FILE")

BACKGROUND_IMAGE=~/.config/themes/$MODE/wallpaper_blur.jpg

# Réglages du flou (utilisé par --effect-blur)
BLUR_RADIUS=15 # Rayon du flou
BLUR_TIMES=5   # Nombre d'itérations du flou (plus élevé = plus flou)

# Réglages de luminosité (valeur entre 0 et 1, par exemple 0.3 pour assombrir de 30%)
# On superpose une couche noire transparente via ImageMagick, car swaylock-effects n'a pas d'option native pour ça.
BRIGHTNESS_OVERLAY_ALPHA=0.3 # 0.3 signifie 30% d'opacité noire

# Chemin temporaire pour l'image traitée (si ImageMagick est utilisé)
TEMP_IMAGE="/tmp/lock_background.png"

# ===========================================
#             COULEURS THÈME ORANGÉ
# ===========================================
# Utilisation de la notation RGBA (Hex RVB + Alpha) pour la transparence
# Ex: #RRGGBBAA où AA est la transparence (FF = opaque, 00 = transparent)

COLOR_ORANGE_DARK="#FF5722FF"    # Orange profond (opaque)
COLOR_ORANGE_ACCENT="#FF9800FF"  # Orange vif (opaque)
COLOR_ORANGE_LIGHT="#FFCC80FF"   # Orange pâle (opaque)

COLOR_TEXT_LIGHT="#FFFFFFFF"     # Texte clair (blanc opaque)
# COLOR_TEXT_DARK n'est pas utilisé dans cette config, mais utile pour d'autres éléments.

# Couleurs de l'indicateur
COLOR_RING_BACKGROUND="#424242CC" # Gris foncé semi-transparent (base de l'anneau)
# COLOR_RING_ACTIVE : Cette option n'existe pas dans ta version
COLOR_RING_CLEAR="$COLOR_ORANGE_LIGHT"   # Orange pâle (après succès)
COLOR_RING_VERIFY="$COLOR_ORANGE_ACCENT" # Orange vif (lors de la vérification)
COLOR_RING_WRONG="$COLOR_ORANGE_DARK"    # Orange profond (erreur)

# Couleur de l'arrière-plan de l'icône/du texte (semi-transparent pour un look moderne)
COLOR_BACKGROUND_OVERLAY="#30303080" # Gris très foncé semi-transparent

# ===========================================
#             PRÉPARATION DE L'IMAGE DE FOND
# ===========================================
FINAL_BACKGROUND="" # Initialisation de la variable

if [ -z "$BACKGROUND_IMAGE" ]; then
    # Capturer l'écran
    grim "$TEMP_IMAGE"

    # Appliquer l'assombrissement avec ImageMagick (car swaylock-effects n'a pas d'option native pour ça)
    magick "$TEMP_IMAGE" -fill black -colorize 50% "$TEMP_IMAGE"

    FINAL_BACKGROUND="$TEMP_IMAGE"
else
    # Utiliser l'image de fond statique
    FINAL_BACKGROUND="$BACKGROUND_IMAGE"
fi

# Vérifier si l'image finale existe
if [ ! -f "$FINAL_BACKGROUND" ]; then
    notify-send "Swaylock Error" "Impossible de trouver l'image de fond : $FINAL_BACKGROUND"
    exit 1
fi

# ===========================================
#             LANCEMENT DE SWAYLOCK-EFFECTS
# ===========================================
# Utilisation de --effect-blur nativement !

swaylock \
  --image "$FINAL_BACKGROUND" \
  --scaling fill \
  \
  --fade-in 0.5 \
  \
  --indicator \
  --indicator-idle-visible \
  --indicator-radius 100 \
  --indicator-thickness 7 \
  \
  --key-hl-color "$COLOR_ORANGE_ACCENT" \
  --bs-hl-color "$COLOR_ORANGE_DARK" \
  --separator-color "$COLOR_TEXT_LIGHT" \
  \
  --font "Fira Code Retina" \
  --text-color "$COLOR_TEXT_LIGHT" \
  \
  --line-color "$COLOR_RING_BACKGROUND" \
  --ring-color "$COLOR_RING_BACKGROUND" \
  --inside-color "$COLOR_BACKGROUND_OVERLAY" \
  --inside-clear-color "$COLOR_BACKGROUND_OVERLAY" \
  --inside-ver-color "$COLOR_BACKGROUND_OVERLAY" \
  --inside-wrong-color "$COLOR_BACKGROUND_OVERLAY" \
  \
  --ring-clear-color "$COLOR_RING_CLEAR" \
  --ring-ver-color "$COLOR_RING_VERIFY" \
  --ring-wrong-color "$COLOR_RING_WRONG" \
  \
  --text-clear-color "$COLOR_TEXT_LIGHT" \
  --text-ver-color "$COLOR_TEXT_LIGHT" \
  --text-wrong-color "$COLOR_TEXT_LIGHT" \
  \
  --line-uses-inside \
  \
  --clock \
  --timestr "%H:%M" \
  \
  "$@" # Permet de passer des arguments supplémentaires si besoin

# ===========================================
#             NETTOYAGE
# ===========================================
# Supprime l'image temporaire si elle a été générée
if [ -z "$BACKGROUND_IMAGE" ] && [ -f "$TEMP_IMAGE" ]; then
    rm "$TEMP_IMAGE"
fi
