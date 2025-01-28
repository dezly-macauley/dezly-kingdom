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

# Allows you to set themes for GUI applications 
# like virt-manager and pavucontrol
sudo pacman -S --needed nwg-look

# A GTK theme
# Changes the appearance of applications like 
# `pavucontrol` and `virt-manager`
sudo pacman -S --needed materia-gtk-theme

#______________________________________________________________________________
