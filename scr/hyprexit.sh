#!/bin/bash

if pgrep -x hyprland >/dev/null; then
	hyprctl dispatch exit 0
	sleep 2

	if pgrep -x hyprland >/dev/null; then
		killall -9 hyprland
	fi
fi


if pgrep -x Hyprland >/dev/null; then
	hyprctl dispatch exit 0
	sleep 2

	if pgrep -x Hyprland >/dev/null; then
		killall -9 Hyprland
	fi
fi
