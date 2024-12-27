#!/bin/sh

echo "Welcome to the Dezly Kingdom Installer"

# This will update the Arch package manager,
# and then upgrade any outdated software before installing Dezly Kingdom
sudo pacman -Syu

./scripts/rust.sh
