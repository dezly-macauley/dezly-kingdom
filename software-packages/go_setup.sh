#!/bin/sh

# The Go programming
sudo pacman -S --needed go

# Language support for Go
sudo pacman -S --needed gopls

# NOTE: This is where I prefer go to install global packages
[ ! -d "$HOME/.go-global-pkgs" ] \
&& mkdir -p "$HOME/.go-global-pkgs"
