#!/usr/bin/env bash
[ $# -eq 0 ] && echo "Usage: $0 <search query>" && exit -1
while [ ! $# -eq 0 ]; do
  ARGS="$ARGS $1"
  shift
done
ARGS=${ARGS:1}
DUCKDUCKGO="https://duckduckgo.com/?q="
#DEGOOG="https://degoog.org/?q=" # doesn't work
SEARX="https://search.rhscz.eu/search?q="
ACTIVE_ENGINE="$DUCKDUCKGO"
BROWSER=w3m
if [ "$BROWSER" = "w3m" ]; then
$BROWSER -sixel -o auto_image=TRUE -insecure -o display_image=1 "$ACTIVE_ENGINE$ARGS" 
else
$BROWSER "$ACTIVE_ENGINE$ARGS" 
fi
