#!/usr/bin/bash
SHOW_IP=0
IP=$(ip addr show | sed -n 's/\/[0-9]*//;/3:.*/,$p' | awk '/^[ ]*inet / { print $2 }')
NETWORK_NAME=$(nmcli c show --active | awk -n '/wifi.*wlan0/ { print $1 }')
ICON=""
[ "$IP" = "" ] && ICON="󰈂" && NETWORK_NAME="Disconnected"
OUTPUT="$ICON $NETWORK_NAME"
[[ SHOW_IP -eq 1 ]] && [ "$IP" != "" ] && OUTPUT="$OUTPUT $IP"

echo $OUTPUT
