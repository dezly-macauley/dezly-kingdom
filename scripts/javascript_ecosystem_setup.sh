#!/bin/sh

# The JavaScript Runtime
sudo pacman -S --needed nodejs

# JavaScript with syntax for types
# This is also required by `svelte-language-server`
sudo pacman -S --needed typescript

# The language server for Svelte 
sudo pacman -S --needed svelte-language-server