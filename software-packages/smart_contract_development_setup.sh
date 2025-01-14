#!/bin/sh
#______________________________________________________________________________
# SECTION: Vyper Smart Contracts

# NOTE: This requires `uv` to be installed and setup first

# The Vyper compiler
uv tool install vyper

# Language support for Vyper
uv tool install vyper-lsp

# A smart contract development framework for Vyper smart contracts
uv tool install moccasin --prerelease=allow

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

# SECTION: Foundry (Smart Contract development framework for Solidity)

# NOTE: You can uncomment this after your first install,
# otherwise you will download the latest version of `foundry` 
# (A web3 framework) every time you update your system

# cargo install --git https://github.com/foundry-rs/foundry --profile release --locked forge cast chisel anvil

#______________________________________________________________________________
