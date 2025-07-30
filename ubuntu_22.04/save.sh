#!/bin/bash

# Create .config directory if it doesn't exist in the current directory
mkdir -p .config

# Copy config directories from ~/.config to current dir's .config
cp -r ~/.config/i3 .config/
cp -r ~/.config/i3status .config/
cp -r ~/.config/rofi .config/
cp -r ~/.config/nvim .config/
cp -r ~/.config/picom .config/
cp -r ~/.config/kitty .config/
cp -r ~/.config/wallpapers .config/
cp -r ~/.config/dunst .config/
cp -r ~/.config/ranger .config/

# Copy files from home directory to current directory
cp ~/.zshrc .
cp -r ~/.oh-my-zsh .

echo "Configuration files and directories have been copied to $(pwd)"
