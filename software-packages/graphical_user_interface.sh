#!/bin/sh

sudo pacman -S --needed hyprland
sudo pacman -S --needed hyprpaper

sudo pacman -S --needed qt5-wayland
sudo pacman -S --needed qt6-wayland

sudo pacman -S --needed xdg-desktop-portal-hyprland
sudo pacman -S --needed xdg-desktop-portal-gtk

sudo pacman -S --needed wl-clipboard
sudo pacman -S --needed wl-clip-persist

# Displays notifications
sudo pacman -S --needed swaync 

sudo pacman -S --needed wofi
