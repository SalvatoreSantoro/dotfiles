#!/bin/bash

# This script will randomly go through the files of a directory, setting it
# up as the wallpaper at regular intervals
#
# NOTE: this script uses bash (not POSIX shell) for the RANDOM variable

# This controls (in seconds) when to switch to the next image
#sleep 2
INTERVAL=300
MONITOR=eDP-1

while true; do
	find "$1" \
		| while read -r img; do
			echo "$((RANDOM % 1000)):$img"
		done \
		| sort -n | cut -d':' -f2- \
		| while read -r img; do
            if [[ "$img" != "$1" ]]; then
                uwsm app -- hyprctl hyprpaper preload "$img"
                uwsm app -- hyprctl hyprpaper wallpaper "$MONITOR,$img"
                uwsm app -- hyprctl hyprpaper unload "$img"
                ln -sf "$img" "$HOME/.config/wallpapers/.current_wallpaper"
                export "WALLPAPER=$img"
			    sleep $INTERVAL
            fi 
		done
done
