#!/bin/sh

#______________________________________________________________________________
# Power Management
paru -S --needed auto-cpufreq

# Enable and start auto-cpfreq
sudo systemctl enable --now auto-cpufreq.service

#______________________________________________________________________________
# Database Management

# A language server for SQL that is written in Go
paru -S --needed sqls

# A Terminal Client for MySQL with AutoCompletion and Syntax Highlighting
paru -S --needed mycli

#______________________________________________________________________________
