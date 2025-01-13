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
# SECTION: Version Control

./software-packages/version_control.sh

#______________________________________________________________________________
# SECTION: Programming Languages

# NOTE: Rust should be the first thing that should be 
# installed and properly setup.
# This is because many programs in Dezly Kingdom depend on Rust,
# or need to be installed from the AUR (Arch User Repository) 
# using the AUR Helper Paru (Which has to be built from source using Rust)

# Systems Programming
./software-packages/rust_setup.sh
./software-packages/assembly_x86_64.sh
./software-packages/zig_setup.sh
./software-packages/go_setup.sh

./software-packages/python_setup.sh
./software-packages/lua_setup.sh

./software-packages/html_and_css_setup.sh
./software-packages/javascript_ecosystem_setup.sh

#______________________________________________________________________________
# SECTION: Core Essentials
./software-packages/firewall.sh
./software-packages/fonts_setup.sh
./software-packages/audio_setup.sh
./software-packages/image_setup.sh
./software-packages/file_management_setup.sh
./software-packages/terminal_setup.sh
./software-packages/graphical_user_interface.sh
./software-packages/web_browser_setup.sh

#______________________________________________________________________________
# SECTION: Database Management

./software-packages/sql_databases.sh

#______________________________________________________________________________
# SECTION: Source-built packages

./software-packages/source_built_pkgs.sh

#______________________________________________________________________________
# SECTION: AUR Packages

./software-packages/aur_packages.sh

#______________________________________________________________________________
# SECTION: Ethical Hacking

./software-packages/ethical_hacking_setup.sh

#______________________________________________________________________________
echo " "
echo "Dezly Kingdom has been installed"
echo "Please reboot your system if this is your first install"
#______________________________________________________________________________
