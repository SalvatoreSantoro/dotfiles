#!/usr/bin/env bash

if [ ! -e /dev/video9 ]; then
	sudo modprobe v4l2loopback video_nr=9 card_label=Video-Loopback exclusive_caps=1
else
	echo "Virtual device already existing"
fi
obs --startvirtualcam > /dev/null 2>&1 &
env XDG_SESSION_TYPE=x11 discord > /dev/null 2>&1  &
