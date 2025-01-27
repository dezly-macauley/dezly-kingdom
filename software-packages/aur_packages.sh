#!/bin/sh
#______________________________________________________________________________
# Power Management
paru -S --needed auto-cpufreq

# Enable and start auto-cpufreq
sudo systemctl enable --now auto-cpufreq.service
#______________________________________________________________________________
# Screenshots

# A utility to easily take screenshots in Hyprland 
paru -S --needed hyprshot

#______________________________________________________________________________
# GTK themes

# A GTK theme for GUI applications that can be used by nwg-look
paru -S --needed catppuccin-gtk-theme-mocha

#______________________________________________________________________________
# Screen lock

# Allows you to lock and unlock your screen
paru -S --needed swaylock-effects 

#______________________________________________________________________________
