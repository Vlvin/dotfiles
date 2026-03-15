#!/usr/bin/sh
# mmsg -g -c | awk '/title/ { print $3 }'
# mmsg -g -c | awk '/appid/ { print $3 }'
# echo $(mmsg -g -c) | awk '{ print $6 " : " $3 }'
VAR=$(mmsg -g -c)
# echo $VAR
TITLE=$VAR
TITLE=${TITLE##*title }
TITLE=$(echo ${TITLE%% *appid} | awk 'BEGIN{FS=OFS=" "}{NF-=3; print}')
# APPID=$(echo ${APPID%% *appid} | awk 'BEGIN{FS=OFS=" "}{NF-=3; print}')
echo $TITLE


