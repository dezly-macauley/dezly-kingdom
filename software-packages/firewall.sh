#!/bin/sh
#______________________________________________________________________________

# Uncomplicated Firewall
sudo pacman -S --needed ufw 

#______________________________________________________________________________
# Block people from accessing Dezly Kingdom remotely
# via port 80, aka SSH (Secure Shell)

# NOTE: If you ever need this enabled for some reason,
# use:
# sudo ufw limit 22/tcp
# This will protect Dezly Kingdom from brute-force password attacks. 

sudo ufw deny 22/tcp

#______________________________________________________________________________

# Block people from accessing Dezly Kingdom remotely
# via port 80 (HTTP), and port 443 (HTTPS)
sudo ufw deny 80/tcp
sudo ufw deny 443/tcp

#______________________________________________________________________________
