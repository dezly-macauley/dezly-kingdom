#!/bin/sh

# Thw Python programming language
sudo pacman -S --needed python 

# The language support for Python
sudo pacman -S --needed pyright

# The default Python package manager
sudo pacman -S --needed python-pip

#______________________________________________________________________________
# NOTE: This configures pip to install global packages to the directory
# `~/.pip-global-pkgs`

if [[ ! -f "$HOME/.config/pip/pip.conf" ]]; then
    mkdir -p "$HOME/.config/pip" && touch "$HOME/.config/pip/pip.conf"
    cat > ~/.config/pip/pip.conf << EOF
[global]

# This is where pip downloads and unpacks the packages
target = ~/.pip-global-pkgs

# This is where pip install the package executable and library
install.prefix = ~/.pip-global-pkgs
EOF
fi

#______________________________________________________________________________

# An extremely fast Python package installer and resolver written in Rust
sudo pacman -S --needed uv
