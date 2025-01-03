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

# This will create the `pip-global-pkgs` directory if it doesn't exist 
# if [[ ! -d "$HOME/.pip-global-pkgs" ]]; then
#     mkdir -p "$HOME/.pip-global-pkgs"
# fi

# This will configure `pip/pip.conf` if it doesn't exist 
# if [[ ! -f "$HOME/.config/pip/pip.conf" ]]; then
#     mkdir -p "$HOME/.config/pip"
#     cat > "$HOME/.config/pip/pip.conf" << EOF
# [global]
#
# # This is where pip downloads and unpacks the packages
# target = $HOME/.pip-global-pkgs
#
# # This is where pip installs the package executable and library
# install.prefix = $HOME/.pip-global-pkgs
# EOF
# fi

#______________________________________________________________________________
# An extremely fast Python package installer and resolver written in Rust
sudo pacman -S --needed uv

#______________________________________________________________________________
