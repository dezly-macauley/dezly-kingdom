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
