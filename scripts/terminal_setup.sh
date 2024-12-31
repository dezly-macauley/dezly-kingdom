#!/bin/sh
# SECTION: Terminal Workflow

#______________________________________________________________________________
# SUB_SECTION: Shell

# Interactive Shell
sudo pacman -S --needed zsh
sudo pacman -S --needed zsh-syntax-highlighting
sudo pacman -S --needed zsh-autosuggestions

# Change shell to zsh
chsh -s /usr/bin/zsh

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

# This is a search tool that is used by the Neovim plugin `telescope nvim`
sudo pacman -S --needed ripgrep

# This is a search tool that is used by the Neovim plugin `telescope nvim`
sudo pacman -S --needed fd 

# This is needed to build this plugin which is a dependecy of:
# `nvim-telescope/telescope-fzf-native.nvim`
sudo pacman -S --needed clang

#______________________________________________________________________________
# Language support for bash
sudo pacman -S --needed bash-language-server

#______________________________________________________________________________
