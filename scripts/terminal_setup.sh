#!/bin/sh
# SECTION: Terminal Workflow

#______________________________________________________________________________
# SUB_SECTION: Shell

# Interactive Shell
sudo pacman -S --needed zsh
sudo pacman -S --needed zsh-syntax-highlighting
sudo pacman -S --needed zsh-autosuggestions

# This will check what the current shell is set to
current_shell="$SHELL"

# This will change the current shell to zsh if the shell is not
# already zsh
if [ "$current_shell" != "/usr/bin/zsh" ]; then
    sudo chsh -s /usr/bin/zsh
    echo "The current shell has been changed to zsh"
else
    echo " "
    echo "The current shell is already Zsh. No changes made."
    echo " "
fi

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
