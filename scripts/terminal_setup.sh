#!/bin/sh
# SECTION: Terminal Workflow

#______________________________________________________________________________
# SUB_SECTION: Shell

# Interactive Shell
sudo pacman -S --needed zsh
sudo pacman -S --needed zsh-syntax-highlighting
sudo pacman -S --needed zsh-autosuggestions

# Shell Prompt Appearance
sudo pacman -S --needed starship

# My Nerd Font of choice
sudo pacman -S --needed ttf-meslo-nerd

# Use Starship Nerd Font Preset
starship preset nerd-font-symbols -o ~/.config/starship.toml

# Output Appearance
sudo pacman -S --needed lsd
sudo pacman -S --needed tree

#______________________________________________________________________________
# SUB_SECTION: Terminal

# Terminal Emulators
sudo pacman -S --needed ghostty
sudo pacman -S --needed kitty

# A terminal workspace written in Rust
sudo pacman -S --needed zellij

# A Rust-Powered Terminal File Manager
sudo pacman -S --needed yazi 

#______________________________________________________________________________
# SUB_SECTION: Terminal-Based Code Editor

# My primary code editor
sudo pacman -S --needed neovim

#______________________________________________________________________________
