#!/bin/bash
DIR=~/Immagini

# Check if the directory exists, if not, create it

export WLR_NO_HARDWARE_CURSORS=1 
grim -c -g "$(slurp)" -o $DIR/$(date +%Y%m%d-%H%M%S).png 


notify-send -t 3000 "Screenshot captured"
