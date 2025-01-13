#!/bin/sh

# A Rust-Powered Terminal File Manager
sudo pacman -S --needed yazi 

# USB mass storage devices, 
# like thumb drives, mobile phones, digital cameras, 
# etc. are not mounted automatically to the file system.

# udiskie will do this automatically

# NOTE: Remember to give your username, write permission to 
# the external drives that have been mounted

# sudo chown -R your-username: mount-point
# If you don't know the mount point use the `lsblk` command
sudo pacman -S --needed udiskie

# Safely delete, restore, or permanently delete files from the command line
sudo pacman -S --needed trash-cli

# Extract rar files
sudo pacman -S --needed unrar
