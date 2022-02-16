#!/bin/bash

case "$1" in
	"select") maim -s | xclip -selection clipboard -t image/png || exit ;;
	*) maim "/home/$USER/Pictures/Screenshots/$(date).png" || exit ;;
esac

notify-send "Screenshot taken."
