
Grim takes screenshots

`sudo pacman -S grim`

Slurp selects the area

`sudo pacman -S slurp`

To get rid of the black border when taking screenshots

`sudo pacman -S imagemagick`


`cd ~`

`mkdir screenshots`

---

### How to use

Use this:

`timestamp=$(date +"%Y%m%d_%H%M%S") && grim -g "$(slurp)" - | convert - -shave 1x1 PNG:- > /home/dezly-macauley/screenshots/screenshot_$timestamp.png`

Add the following keybinding to ~/.config/hypr/hyprland.conf


# Take a screenshot:
# NOTE: This requires grim, slurp, and imagemagick
bind = $mainMod, S, exec, timestamp=$(date +"%Y%m%d_%H%M%S") && grim -g "$(slurp)" - | convert - -shave 1x1 PNG:- > /home/dezly-macauley/screenshots/screenshot_$timestamp.png 

Make sure to comment out this line as well.
# bind = $mainMod, S, togglespecialworkspace, magic

---


To take a screenshot of the entire desktop (all monitors):
`grim`

To take a screenshot of a specific monitor


First you need to know the name of your monitor:
`hyprctl monitors`

❯ hyprctl monitors

Monitor eDP-1 (ID 0):

`grim -o edD-1 -t jpeg`

`grim -o HDMI-A-2 -t png`

---

Add a dash at the end to pipe this into another command

`grim -o HDMI-A-2 -t png -`

E.g.

Save to clipboard

`grim -g "$slurp" - | wl-copy`

---

To select a specific part of the screen

`grim -g "$(slurp)"`


To get rid of the black border when taking screenshots

`grim -g "$(slurp)" - | convert - -shave 1x1 PNG:- | wl-copy`

In most cases use this
`grim -g "$(slurp)" - | convert - -shave 1x1 screenshot.png`

--- 

For screenshot annotations, I use swappy

`sudo pacman -S swappy`

To use it, do this:

`grim -g "$(slurp)" - | swappy -f -`



--- 


