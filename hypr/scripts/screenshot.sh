#!/bin/bash
DIR=~/Immagini

export WLR_NO_HARDWARE_CURSORS=1 
grim -c -g "$(slurp)" $DIR/$(date +%Y%m%d-%H%M%S).png && notify-send -t 3000 "Screenshot captured"

