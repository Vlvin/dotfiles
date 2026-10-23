#!/usr/bin/bash
SHOW_IP=1
[ $# -eq 1 ] && SHOW_IP=$1
IP=$(ip addr show | sed -n 's/\/[0-9]*//;/3:.*/,$p' | awk '/^[ ]*inet / { print $2 }')
NETWORK_NAME=$(nmcli c show --active | awk -n '/wifi/ { print $1 }')
ICON=""
if [ "$IP" = "" ]; then 
  ICON="󰈂" 
  NETWORK_NAME="Disconnected"
fi
OUTPUT="$ICON $NETWORK_NAME"
[[ SHOW_IP -eq 1 ]] && [ "$IP" != "" ] && OUTPUT="$OUTPUT $IP"


echo $OUTPUT
#[ SHOW_IP -e 1 ] && 
