#!/bin/sh

# USB mass storage devices, 
# like thumb drives, mobile phones, digital cameras, 
# etc. are not mounted automatically to the file system.

# udiskie will do this automatically
sudo pacman -S --needed udiskie
