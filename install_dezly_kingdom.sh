#!/bin/sh

#______________________________________________________________________________

echo "Welcome to the Dezly Kingdom Installer"

# This will update the Arch package manager,
# and then upgrade any outdated software before installing Dezly Kingdom

# NOTE: Turn the next line into a comment after installing Dezly Kingdom 
# if you don't want to perform a full system upgrade each time you install
# something
# sudo pacman -Syu

#______________________________________________________________________________
# SECTION: Rust

# Rust should be the first thing that should be installed and properly setup, 
# because many programs in Dezly Kingdom depend on Rust,
# or need to be installed from the AUR (Arch User Repository) 
# using the AUR Helper Paru (Which has to be built from source using Rust)
./scripts/rust_setup.sh

#______________________________________________________________________________
# SECTION: Core Essentials
./scripts/audio_setup.sh
./scripts/terminal_setup.sh

#______________________________________________________________________________
# SECTION: Database Management

# Setup SQLite
./scripts/sqlite_setup.sh
#______________________________________________________________________________
# SECTION: Programming Languages
./scripts/python_setup.sh
./scripts/lua_setup.sh

#______________________________________________________________________________
echo " "
echo "Dezly Kingdom has been installed"

#______________________________________________________________________________
