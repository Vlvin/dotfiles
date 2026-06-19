#!/usr/bin/env sh
[ $# -eq 0 ] && echo "Usage: $0 <search query>" && exit -1
while [ ! $# -eq 0 ]; do
  ARGS="$ARGS $1"
  shift
done
w3m -sixel -o auto_image=TRUE -o display_image=1 "https://duckduckgo.com/?q=$ARGS" 
 
