#!/usr/bin/env sh
rm -drf $HOME/.config/runit/service/**/supervise
runsvdir $HOME/.config/runit/service & disown
