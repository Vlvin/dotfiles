#!/usr/bin/bash
# | sed 's/Gi//g'
USED=$(free -h | awk '/^Mem/ { print $3 }')
USED_MOD=1;
[ "$(echo $USED | sed 's/[^G]//g')" != "" ] && USED_MOD=1000000;
[ "$(echo $USED | sed 's/[^M]//g')" != "" ] && USED_MOD=1000;
USED=$(echo $USED | sed 's/Gi//g;s/Mi//g')
FREE=$(free -h | awk '/^Mem/ { print $2 }')
FREE_MOD=1;
[ "$(echo $FREE | sed 's/[^G]//g')" != "" ] && FREE_MOD=1000000;
[ "$(echo $FREE | sed 's/[^M]//g')" != "" ] && FREE_MOD=1000;
FREE=$(echo $FREE | sed 's/Gi//g;s/Mi//g')
PERCENTAGE=$(echo "$USED*$USED_MOD*100/($FREE*$FREE_MOD)" | bc)
echo "$PERCENTAGE%"
echo "$USED*$USED_MOD*100/($FREE*$FREE_MOD)" 
