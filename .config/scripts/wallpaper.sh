#!/usr/bin/sh
awww img  $(fzf --walker-root=$HOME/.config/wallpapers --preview="$XDG_CONFIG_HOME/scripts/fzf-preview.sh {}")
