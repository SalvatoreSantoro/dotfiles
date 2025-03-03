#!/bin/bash

# ---------- Xwayland ------------
# ensure xdg run dir exists and is clean
[[ -d "/tmp/run/$USER" ]] && rm -rf "/tmp/run/$USER"
mkdir -p "/tmp/run/$USER"
chmod 0700 "/tmp/run/$USER"
XDG_RUNTIME_DIR="/tmp/run/$USER"

#setup other variables
mkdir -p "$HOME"/.{config,cache,local/share}
XDG_DATA_HOME="$HOME/.local/share"
XDG_DATA_DIRS="/usr/local/share:/usr/share"
XDG_CONFIG_HOME="$HOME/.config"
XDG_CACHE_HOME="$HOME/.cache"

export XDG_RUNTIME_DIR XDG_DATA_{HOME,DIRS} XDG_{CONFIG,CACHE}_HOME

# ---------- Wayland -------------
#setup variables
QT_WAYLAND_FORCE_DPI=physical
GDK_BACKEND=wayland
QT_QPA_PLATFORM=wayland-egl
CLUTTER_BACKEND=wayland
SDL_VIDEODRIVER=wayland
BEMENU_BACKEND=wayland

export QT_WAYLAND_FORCE_DPI GDK_BACKEND QT_QPA_PLATFORM CLUTTER_BACKEND SDL_VIDEODRIVER BEMENU_BACKEND

exec sway --unsupported-gpu
