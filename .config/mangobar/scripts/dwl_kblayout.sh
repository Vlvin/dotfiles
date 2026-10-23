#!/usr/bin/env bash
LANG="$(cat /tmp/dwl-keymap)"
echo ${LANG:0:2} | awk '{ print tolower($0) }'
