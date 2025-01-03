#!/bin/sh

# A Rust-Powered Terminal File Manager
sudo pacman -S --needed yazi 

# USB mass storage devices, 
# like thumb drives, mobile phones, digital cameras, 
# etc. are not mounted automatically to the file system.

# udiskie will do this automatically
sudo pacman -S --needed udiskie

# Safely delete, restore, or permanently delete files from the command line
sudo pacman -S --needed trash-cli
