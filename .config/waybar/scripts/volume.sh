#!/bin/bash

if [[ "$1" == "--inc" ]]; then
	pamixer -i 5

elif [[ "$1" == "--dec" ]]; then
	pamixer -d 5

elif [[ "$1" == "--toggle" ]]; then
	if [ "$(pamixer --get-mute)" == "false" ]; then
		pamixer -m
		notify-send "Volume OFF"
	elif [ "$(pamixer --get-mute)" == "true" ]; then
		pamixer -u
		notify-send "Volume ON"
	fi

elif [[ "$1" == "--mic-inc" ]]; then
	pamixer --default-source -i 5
	notify-send "Microphone : $(pamixer --default-source --get-volume) %"

elif [[ "$1" == "--mic-dec" ]]; then
	pamixer --default-source -d 5
	notify-send "Microphone : $(pamixer --default-source --get-volume) %"

elif [[ "$1" == "--mic-toggle" ]]; then
	if [ "$(pamixer --default-source --get-mute)" == "false" ]; then
		pamixer --default-source -m
		notify-send "Microphone OFF"
	elif [ "$(pamixer --default-source --get-mute)" == "true" ]; then
		pamixer -u --default-source u
		notify-send "Microphone ON"
	fi
fi
