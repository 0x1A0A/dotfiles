#!/bin/bash

if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
	case $1 in
		d)
			grim -t png - | tee ~/Pictures/Screenshots/$(date +"d-%b-%I-%M").png | wl-copy
			;;
		w)
			window=$(hyprctl activewindow | awk '/at[:]/ {print $2}; /size[:]/ {print $2}' | tr '\n' ' ' | sed 's/\(.*\),\(.*\) /\1x\2/')
			grim -t png -g "$window" - | tee ~/Pictures/Screenshots/$(date +"w-%b-%I-%M").png | wl-copy
			;;
		s)
			grim -t png -g "$(slurp)" - | tee ~/Pictures/Screenshots/$(date +"s-%b-%I-%M").png | wl-copy
			;;
	esac
else
	case $1 in
		d)
			maim -i root | tee ~/Pictures/Screenshots/$(date +"d-%b-%I-%M").png | xclip -selection clipboard -t image/png
			;;
		w)
			maim -st 9999998 | tee ~/Pictures/Screenshots/$(date +"w-%b-%I-%M").png | xclip -selection clipboard -t image/png
			;;
		s)
			maim -s | tee ~/Pictures/Screenshots/$(date +"s-%b-%I-%M").png | xclip -selection clipboard -t image/png
			;;
	esac
fi

# maim -i root | tee ~/Pictures/Screenshots/$(date +"dp-%b-%I-%M").png | xclip -selection clipboard -t image/png

