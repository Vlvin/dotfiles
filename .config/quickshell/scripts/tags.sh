#!/usr/bin/sh

function selected() {
  TAG_INFO=$(mmsg -g -t | awk '/tag [0-9] 1/ { print $3 }')
  echo $TAG_INFO
}
function non_empty() {
  TAG_INFO=$(mmsg -g -t | awk '/tag [0-9] [01] [^0] [01]/ { print $3 }')
  echo $TAG_INFO
}

while [[ $# > 0 ]]; do
  case "$1" in
    "selected")
      selected
      ;;
    "non_empty")
      non_empty
      ;;
  esac
  shift
done

