#!/usr/bin/sh
FREE=$(top -bn1 | awk '/^%Cpu/ { print $8 }')
echo $(echo "100.0-$FREE" | bc)%
