#!/bin/bash

cp -r i3 ~/.config/i3
cp -r i3status ~/.config/i3status
cp -r rofi ~/.config/rofi
cp -r nvim ~/.config/nvim
cp -r picom ~/.config/picom
cp -r kitty ~/.config/kitty
cp -r wallpapers ~/.config/wallpapers
cp -r dunst ~/.config/dunst
cp -r ranger ~/.config/dunst
cp .zshrc ~
cp -r .oh-my-zsh ~

#copy fonts to snap apps
ln -s ~/.local/share/fonts ~/snap/firefox/current/.local/share/fonts
