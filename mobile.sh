#!/usr/bin/env bash

PHONEID="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx"
ICON=""
#ملاحظة غير الid حق الجوال يختلف من جوال لاخر
if ! pgrep -x kdeconnectd > /dev/null; then
    echo "{\"text\": \"$ICON ?\", \"class\": \"critical\"}"
    exit 0
fi

reachable=$(qdbus org.kde.kdeconnect \
    /modules/kdeconnect/devices/$PHONEID \
    org.kde.kdeconnect.device.isReachable 2>/dev/null)

if [ "$reachable" != "true" ]; then
    echo "{\"text\": \"$ICON\", \"class\": \"warning\"}"
    exit 0
fi

battery=$(qdbus org.kde.kdeconnect \
    /modules/kdeconnect/devices/$PHONEID/battery \
    org.kde.kdeconnect.device.battery.charge 2>/dev/null)

if [ -z "$battery" ]; then
    echo "{\"text\": \"$ICON --%\", \"class\": \"critical\"}"
else
    if [ "$battery" -le 20 ]; then
        color="critical"
    elif [ "$battery" -le 50 ]; then
        color="warning"
    else
        color="normal"
    fi
    echo "{\"text\": \"$ICON $battery%\", \"class\": \"$color\"}"
fi
