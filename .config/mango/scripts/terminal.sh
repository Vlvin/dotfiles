#!/usr/bin/sh
[ "$XDG_CONFIG_HOME" = "" ] && XDG_CONFIG_HOME="$HOME/.config"
exec $XDG_CONFIG_HOME/mango/scripts/clearterminal.sh -e tmux
