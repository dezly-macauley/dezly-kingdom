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

# Authentication agent
# For GUI applications that require user permissions
sudo pacman -S --needed hyprpolkitagent

# Allows you to lock and unlock your screen
sudo pacman -S --needed swaylock

# Allows you to set themes for GUI applications 
# like virt-manager and pavucontrol
sudo pacman -S --needed nwg-look

#______________________________________________________________________________
