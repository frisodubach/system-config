#!/bin/sh

# if iwctl station wlan0 show | grep -q "connected"; then
#     icon=""
#     ssid=Amadeus
#     status="Connected to ${ssid}"
# else
#     icon="睊"
#     status="offline"
# fi

# echo "{\"icon\": \"${icon}\", \"status\": \"${status}\"}"
#
symbol() {
    [ $(cat /sys/class/net/w*/operstate) = down ] && echo  && exit
    echo 
}

name() {
    nmcli | grep "^wlp" | sed 's/\ connected\ to\ /Connected to /g' | cut -d ':' -f2
}

[ "$1" = "icon" ] && symbol && exit
[ "$1" = "name" ] && name && exit
