#!/bin/sh

#______________________________________________________________________________
# Power Management
paru -S --needed auto-cpufreq

# Enable and start auto-cpfreq
sudo systemctl enable --now auto-cpufreq.service

#______________________________________________________________________________
# SQLite

# paru -S litecli (Don't install this just yet)

#______________________________________________________________________________
