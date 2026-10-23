#!/usr/bin/sh
WALLPATH="$HOME/.config/wallpapers"
[ "$1" != "" ] && WALLPATH="$1"
awww img  $(fzf --walker-root=$WALLPATH --preview="$XDG_CONFIG_HOME/scripts/fzf-preview.sh {}")
