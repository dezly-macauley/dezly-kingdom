#!/bin/sh
#______________________________________________________________________________
# SECTION: Virtual Machine Setup

# QEMU is the virtual machine emulator
# Allows you to run different Operating Systems and architectures
sudo pacman -S --needed qemu-full

# A GUI (Graphical User Interface) tool for managing virtual machines
sudo pacman -S --needed virt-manager

# A simple tool for viewing and interacting with virtual machines
sudo pacman -S --needed virt-viewer

# A virtual network switch for virtual machines
# This is needed if you want your VMs to communicate 
# with each other or the outside network 
sudo pacman -S --needed vde2

# A tool for filtering and managing Ethernet frames at the data link layer.
# helps control how network traffic flows between virtual machines 
# and your physical network
sudo pacman -S --needed ebtables

# A tool for managing network packet filtering (firewalls) 
# and network address translation (NAT).
# It's necessary for setting up things like NAT,
# which allows your VMs to access the internet through your host machine.
sudo pacman -S --needed iptables-nft

# A modern framework for managing firewalls and network traffic, 
# replacing iptables
# It's part of the backend for modern Linux networking. 
# Even if you use iptables-nft, this is the underlying technology
sudo pacman -S --needed nftables

# A lightweight tool for DNS (Domain Name System) 
# and DHCP (Dynamic Host Configuration Protocol).
# This sets up automatic IP addresses and networking for your VMs, 
# so they can connect to the internet or talk to each other easily.
sudo pacman -S --needed dnsmasq

# Tools for creating and managing network bridges.
# A network bridge lets your VMs act 
# like they're on the same network as your host,
# which can be useful for advanced networking setups.
sudo pacman -S --needed bridge-utils

# Open Virtual Machine Firmware, which provides UEFI support 
# for virtual machines.
# Many modern operating systems require UEFI instead of BIOS. 
# This allows your VMs to boot those systems.
sudo pacman -S --needed ovmf

# A software-based TPM (Trusted Platform Module).
# Some operating systems (e.g., Windows 11) 
# require a TPM for security features. 
# This package emulates one so you can install those OSes without issues.
sudo pacman -S --needed swtpm

# For extracting `.7z` files
# Pre-built Kali Linux virtual machines are in this format
sudo pacman -S --needed 7zip 

#______________________________________________________________________________
