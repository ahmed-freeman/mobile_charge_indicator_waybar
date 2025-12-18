#!/bin/bash

if [ -f "hi.txt" ]; then
    cat hi.txt
else
    echo "hi.txt file not found!"
fi

echo
echo "Searching for connected devices via KDE Connect..."
kdeconnect-cli -l

echo
echo "📱 Please copy your mobile ID from the list above."
echo "Then go to mobile.sh to remove your (your_mobile_id)"
echo "and finally run install2.sh to complete the installation."
echo
