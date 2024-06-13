#!/bin/bash

tpadid=$(xinput list | grep "Touchpad" | cut -d'=' -f2 | cut -d'[' -f1)

tpadcode=$(xinput list-props $tpadid | grep "Device Enabled" | grep "Device Enabled" | cut -d'(' -f2 | cut -d')' -f1)

#fetch the number in the parenthesis after "Device Enabled"
#check if touchpad is enabled or disabled with tpadcode

tpadEnabled=$(xinput list-props $tpadid | grep "Enabled ($tpadcode)" | grep "Enabled ($tpadcode)")

#get last character of var
tpadEnabled=${tpadEnabled: -1}


#check if last character of grep is 1



if [ $tpadEnabled -eq 1 ]; then
    xinput set-prop $tpadid $tpadcode 0
    echo "touchpad disabled"
else
    xinput set-prop $tpadid $tpadcode 1
    echo "touchpad enabled"
fi
