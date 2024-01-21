#!/usr/bin/env sh

_id=$(xinput list --name-only | grep -i touchpad)
echo "$_id";

_status=$(xinput list-props "$_id" | grep 'Device Enabled' | awk '{print $(NF)}')
# echo $_status;

if [ "$_status" -eq 1 ]; then
    xinput set-prop "$_id" "Device Enabled" 0
    notify-send -a 'Trackpad' 'DISABLED'
else
    xinput set-prop "$_id" "Device Enabled" 1
    notify-send -a 'Trackpad' 'ENABLED'
fi

xinput list-props "$_id" | grep 'Device Enabled'
