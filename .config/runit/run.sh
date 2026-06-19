#!/usr/bin/sh
[ "$XDG_CONFIG_HOME" = "" ] && XDG_CONFIG_HOME=$HOME/.config
SVDIR="$XDG_CONFIG_HOME/runit/service"
GROUPS="$(id -Gn "$USER" | tr ' ' ':')"
exec chpst -u "$USER:$GROUPS" runsvdir "$SVDIR" &> /dev/null
