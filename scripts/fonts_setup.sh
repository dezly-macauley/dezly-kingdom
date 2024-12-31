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
