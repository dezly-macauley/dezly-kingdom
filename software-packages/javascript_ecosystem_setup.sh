#!/bin/sh

# The JavaScript Runtime
sudo pacman -S --needed nodejs

# The default JavaScript package manager
sudo pacman -S --needed npm

# A Rust-powered JavaScript runtime, 
# with native TypeScript support, and a focus on security
sudo pacman -S --needed deno

# This will create the directory `npm-global-pkgs`
# If it already exists nothing will be done
[ ! -d "$HOME/.npm-global-pkgs" ] \
&& mkdir -p "$HOME/.npm-global-pkgs"

# This will make sure that when you install npm packages using
# `npm install -g`, those packages will be installed to 
# the directory above, rather than the default behavior which is to install
# packages to `/usr`
[ "$(npm config get prefix)" != "$HOME/.npm-global-pkgs" ] \
&& npm set prefix="$HOME/.npm-global-pkgs"
#______________________________________________________________________________
# SUB_SECTION: Install Bun

if ! command -v bun &> /dev/null; then
    echo "Bun is not installed. Installing now..."
    npm install -g bun
else
    echo "Bun is already installed."
    echo "Attempting to upgrade Bun."
    bun upgrade
fi

#______________________________________________________________________________

# JavaScript with syntax for types
# This is also required by `svelte-language-server`
sudo pacman -S --needed typescript

# The language server for Svelte 
sudo pacman -S --needed svelte-language-server
