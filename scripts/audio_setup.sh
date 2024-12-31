#!/bin/sh

#______________________________________________________________________________
# SECTION: Audio Setup

echo " "
echo "Audio Setup Initiated"

# The main tool needed for audio
sudo pacman -S --needed pipewire

# I have only listed these packages for the sake of being thorough
# Normally these packages are already installed if you selected pipewire 
# during the Arch install.
sudo pacman -S --needed pipewire-alsa
sudo pacman -S --needed pipewire-jack
sudo pacman -S --needed pipewire-pulse

# Needed by pipewire
sudo pacman -S --needed wireplumber

# This is a graphical user interface for controlling the volume
sudo pacman -S --needed pavucontrol

# A graphical player for music and video content
sudo pacman -S --needed vlc

#______________________________________________________________________________
