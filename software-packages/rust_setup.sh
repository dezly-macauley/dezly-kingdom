#!/bin/sh
echo "Setting up Rust" 

# Install the Rust toolchain
sudo pacman -S --needed rustup

# Install the latest stable release of Rust
rustup default stable

# Install the nightly release of Rust
# This is needed by a Neovim plugin called `blink.cmp`
# which provides autocompletion

# NOTE: valgrind is not specific to Rust

# A cli tool that checks for memory leaks in your program
sudo pacman -S --needed valgrind

# This let you use the `cargo-valgrind` command. 
# It requires valgrind
# Essentially this command first uses cargo run, 
# and then uses valgrind to run the checks on that binary
cargo install cargo-valgrind

#______________________________________________________________________________

# NOTE: You can uncomment this after your first install,
# otherwise you will download the latest version of `nightly` every time
# you update your system

# rustup install nightly

#______________________________________________________________________________

# Install the language support for Rust
sudo pacman -S --needed rust-analyzer
