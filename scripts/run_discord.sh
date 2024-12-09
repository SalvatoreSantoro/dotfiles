#!/usr/bin/env bash

if [ ! -e /dev/video9 ]; then
	sudo modprobe v4l2loopback video_nr=9 card_label=Video-Loopback exclusive_caps=1
else
	echo "Virtual device already existing"
fi
obs --startvirtualcam > /dev/null 2>&1 &
discord --disable-gpu-compositing --enable-features=UseOzonePlatform --ozone-platform=wayland

#https://www.reddit.com/r/wayland/comments/1cywhh2/anyone_still_seeing_flickering_in/
#env XDG_SESSION_TYPE=x11 discord --force-device-scale-factor=2.0 > /dev/null 2>&1  &

