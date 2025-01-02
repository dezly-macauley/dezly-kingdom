#!/bin/sh

# This version is required by certain programs on the system 
sudo pacman -S --needed lua

# Neovim requires this version which is newer
sudo pacman -S --needed lua51

# The Lua package manager
sudo pacman -S --needed luarocks

# The Lua language server
sudo pacman -S --needed lua-language-server
