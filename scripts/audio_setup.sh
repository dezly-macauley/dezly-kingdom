#!/bin/sh

#______________________________________________________________________________
# SECTION: Audio Setup

echo " "
echo "Audio Setup Initiated"

# The main tool needed for audio
sudo pacman -S --needed pipewire

# Needed by pipewire
sudo pacman -S --needed wireplumber

# This is a graphical user interface for controlling the volume
sudo pacman -S --needed pavucontrol

# A graphical player for music and video content
sudo pacman -S --needed vlc

#______________________________________________________________________________
