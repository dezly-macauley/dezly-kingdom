#!/bin/sh

# Install the tools required to build Paru 
sudo pacman -S --needed base-devel

# Create a directory for Paru
mkdir -p ~/.built-from-source
cd ~/.built-from-source

# Clone the Paru repo
git clone https://aur.archlinux.org/paru.git

# Enter the Paru repo and build from source
cd paru
makepkg -si

#______________________________________________________________________________

# Power Management
paru -S --needed auto-cpufreq

# Enable and start auto-cpfreq
sudo systemctl enable --now auto-cpufreq.service

# To check if auto-cpufreq is running and enabled,
# Run this command:
# systemctl status auto-cpufreq.service

# Update all packages installed from the AUR
paru -Syu

#______________________________________________________________________________
