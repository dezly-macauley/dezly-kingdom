#!/bin/sh

# The Netwide Assembler
# It is a tool that converts your assembly code into 
# machine code (or object code).
sudo pacman -S --needed nasm

# The GNU Compiler Collection
# This is for compiling C code but it can also be used to link object files
sudo pacman -S --needed gcc

# This is a collection of tools that are needed when working
# with low-level programming especially when dealing with assembly or machine
# code.
sudo pacman -S -needed binutils

# This is the GNU Debugger
# It allows you to execute your program line by line.
# It is used for finding errors.
sudo pacman -S -needed gdb

# NOTE: This requires you to Install and setup Rust first

# The language server for Assembly
# Get language support for Assembly when using Neovim
cargo install asm-lsp
