#!/bin/sh
echo "Setting up Rust" 

# Install the Rust toolchain
sudo pacman -S --needed rustup

# Install the latest stable release of Rust
rustup default stable

# Install the language support for Rust
sudo pacman -S --needed rust-analyzer