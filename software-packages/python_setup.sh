#!/bin/sh

# Thw Python programming language
sudo pacman -S --needed python 

# The language support for Python
sudo pacman -S --needed pyright

# The default Python package manager
sudo pacman -S --needed python-pip

#______________________________________________________________________________
# SECTION: Installing packages from PyPi globally using uv

# An extremely fast Python package installer and resolver written in Rust
sudo pacman -S --needed uv

# NOTE: This is where programs from PyPI (The Python Package Index) 
# will be installed to when you use the command:
# `uv tool install name_of_program`

pypi_global_dir="$HOME/.pypi-global-pkgs"

# This will create the `.pypi-global-pkgs` directory 
# if the directory doesn't exist 

if [[ ! -d "$pypi_global_dir" ]]; then
    mkdir -p "$pypi_global_dir"
fi

#______________________________________________________________________________
