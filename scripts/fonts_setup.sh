#!/bin/sh

# NOTE: To find font names do the following
# fc-list | grep -i "Meslo"
#
# # How to read the output:
# <font-file-path>: <font-name>:style=<style>

# So let's say you had:
# /usr/share/fonts/TTF/MesloLGMNerdFont-Regular.ttf: MesloLGM Nerd Font:style=Regular
# The font name is: MesloLGM Nerd Font
# The style of that font is: regular 

sudo pacman -S --needed ttf-meslo-nerd

sudo pacman -S --needed noto-fonts

# Without this package Emoji wiil not be displayed correctly.
# after this package has been installed by this script,
# you should be able to see the crown and castle emojis on this line 👑 🏰
sudo pacman -S --needed noto-fonts-emoji 

sudo pacman -S --needed noto-fonts-cjk
# This is needed to display Chinese, Japanese, and Korean characters
# after this package has been installed by this script,
# You should be able to see the name of my favorite character in Fate Zero:
# The King Of Heroes: 
# Gilgamesh (ギルガメッシュ, Girugamesshu),
# Class Name Archer (アーチャー, Āchā),
