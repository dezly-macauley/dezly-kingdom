#!/bin/sh

# SECTION: Source-built packages

# SUB_SECTION: Paru (AUR Helper)

# Define the directory path
src_build_dir="$HOME/.source-built-pkgs/paru"

if [ ! -d "$src_build_dir" ]; then
    # If Paru has not been built from source already,
    # then clone it from GitHub and build it

    mkdir -p $HOME/.source-built-pkgs/paru
    cd $HOME/.source-built-pkgs/paru

    sudo pacman -S --needed base-devel
    git clone https://aur.archlinux.org/paru.git

    cd paru
    makepkg -si

    echo "Paru has been built from source"
else
    echo "Paru is already available on your system"
fi
