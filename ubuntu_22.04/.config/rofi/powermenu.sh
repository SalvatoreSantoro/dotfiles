#!/bin/bash

# Options
options="  Suspend\n  Reboot\n  Poweroff\n  Exit i3"

# Rofi CMD
chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu" -theme-str 'window { width: 20%; }' -theme nordic)

# Action
case "$chosen" in
  *Suspend)
    systemctl suspend
    ;;
  *Reboot)
    systemctl reboot
    ;;
  *Poweroff)
    systemctl poweroff
    ;;
  *Exit*)
    i3-msg exit
    ;;
esac

