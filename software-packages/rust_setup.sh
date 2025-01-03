#!/bin/sh
echo "Setting up Rust" 

# Install the Rust toolchain
sudo pacman -S --needed rustup

# Install the latest stable release of Rust
rustup default stable

# Install the nightly release of Rust
# This is needed by a Neovim plugin called `blink.cmp`
# which provides autocompletion
rustup install nightly

# Install the language support for Rust
sudo pacman -S --needed rust-analyzer
