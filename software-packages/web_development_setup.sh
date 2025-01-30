#!/bin/sh

echo "________________________________________________________________________"
echo "Installing / Updating Web Development Setup:"

#______________________________________________________________________________
# SUB_SECTION: User Interface

# Language support for HTML
sudo pacman -S --needed vscode-html-languageserver

# Language support for CSS 
sudo pacman -S --needed vscode-css-languageserver

# Language support for Tailwind CSS
sudo pacman -S --needed tailwindcss-language-server
#______________________________________________________________________________
# SUB_SECTION: JavaScript Ecosystem
#
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

# This provides language support for not only TypeScript files (.ts),
# but for TypeScript-React file (.tsx), 
# JavaScript files (.js), and JavaScript-React files (.jsx)
sudo pacman -S --needed typescript-language-server

# The language server for Svelte 
sudo pacman -S --needed svelte-language-server

echo "________________________________________________________________________"
