#!/usr/bin/sh
BATSTAT=""; 
for i in $(upower -b | awk '/(state|percentage)/ { print $2 }' | sed 's/fully-charged/󱐥/;s/discharging/󱐤/;s/charging/󱐋/'); do 
  BATSTAT="$BATSTAT $i"; 
done;
echo ${BATSTAT:1}
