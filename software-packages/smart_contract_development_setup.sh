#!/bin/sh
#______________________________________________________________________________
# SECTION: Vyper Smart Contracts

# NOTE: This requires `uv` to be installed and setup first

#______________________________________________________________________________
# SECTION: Solidity Smart Contracts

# NOTE: This requires `npm` to be installed and setup first

# To avoid any issues use `npm` for global installs instead of Deno
# Deno is to be used for Projects

# The Solidity compiler
# The package is called `solc` but the cli is called `solcjs`
 npm install -g solc
 
# Solidity language support provided by the Nomic Foundation
# This was originally created for Hardhat projects but it works with
# Foundry projects as well.
 npm install -g @nomicfoundation/solidity-language-server

#______________________________________________________________________________
