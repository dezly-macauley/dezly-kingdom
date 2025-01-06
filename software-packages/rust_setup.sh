#!/bin/sh
echo "Setting up Rust" 

# Install the Rust toolchain
sudo pacman -S --needed rustup

# Install the latest stable release of Rust
rustup default stable

# Install the nightly release of Rust
# This is needed by a Neovim plugin called `blink.cmp`
# which provides autocompletion

#______________________________________________________________________________

# NOTE: You can uncomment this after your first install,
# otherwise you will download the latest version of `nightly` every time
# you update your system

# rustup install nightly

#______________________________________________________________________________

# NOTE: You can uncomment this after your first install,
# otherwise you will download the latest version of `foundry` 
# (A web3 framework) every time you update your system

cargo install --git https://github.com/foundry-rs/foundry --profile release --locked forge cast chisel anvil

#______________________________________________________________________________

# Install the language support for Rust
sudo pacman -S --needed rust-analyzer
