#!/bin/bash

# Check if Bluetooth is currently powered on
status=$(bluetoothctl show | grep "Powered: yes")

# If powered on, power off, and vice versa
if [ -n "$status" ]; then
    bluetoothctl power off
    notify-send "Bluetooth OFF"
else
    bluetoothctl power on
    notify-send "Bluetooth ON"
fi
