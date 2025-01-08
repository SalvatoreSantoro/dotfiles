#!/bin/bash
DIR="$1"
MONITOR=eDP-1
RANDOM_FILE=$(find "$DIR" -type f | shuf -n 1)
uwsm app -- hyprctl hyprpaper preload "$RANDOM_FILE"
uwsm app -- hyprctl hyprpaper wallpaper "$MONITOR,$RANDOM_FILE"
uwsm app -- hyprctl hyprpaper unload "$RANDOM_FILE" 
#Link to sync the lock screen with the current bg
ln -sf "$RANDOM_FILE" "$HOME/.config/hypr/.current_wallpaper"
#uwsm app -- wal -i "$RANDOM_FILE"
       
