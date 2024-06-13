#!/bin/bash

# This script simply fetch the xinput information on the device named "Touchpad" and then toggle the device according to its status.


tpadid=$(xinput list | grep "Touchpad" | cut -d'=' -f2 | cut -d'[' -f1)
tpadcode=$(xinput list-props $tpadid | grep "Device Enabled" | grep "Device Enabled" | cut -d'(' -f2 | cut -d')' -f1)

tpadEnabled=$(xinput list-props $tpadid | grep "Enabled ($tpadcode)" | grep "Enabled ($tpadcode)")
tpadEnabled=${tpadEnabled: -1}

if [ $tpadEnabled -eq 1 ]; then
    xinput set-prop $tpadid $tpadcode 0
    echo "touchpad disabled"
else
    xinput set-prop $tpadid $tpadcode 1
    echo "touchpad enabled"
fi
