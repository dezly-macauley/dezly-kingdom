#!/bin/sh
#______________________________________________________________________________
# SECTION: QEMU, KVM and Virt-Manager

# A machine emulator and virtualizer
# By using dynamic translation, it can create virtual machines that run
# at close to native performance (which is better than VirtualBox).
# The `qemu-full` package can create virtual machines for architectures 
# outside of the usual x86_64 architecture
sudo pacman -S --needed pacman qemu-full

# A set of libraries and tools) that manages virtual machines
# libvirt interacts with QEMU behind the scenes, 
# making sure everything runs smoothly, 
# while QEMU focuses on running the virtual machine.
# It works in the background and is used by Graphical User Interfaces like
# Virt-Manager.
sudo pacman -S --needed libvirt

# A graphical user interface (GUI) for libvirt.
# It communicates with libvirt so that you don't have to enter any commands.
sudo pacman -S --needed virt-manager

# Gives your Virtual Machine an IP address 
# and handles DNS for internet access.
sudo pacman -S --needed dnsmasq 

# Controls the flow of network traffic and secures connections.
# Works with `dnsmasq` to ensure that your VM can access the internet 
# and stay protected.
sudo pacman -S --needed iptables

#______________________________________________________________________________
# SECTION: VirtualBox

# The virtual box package
sudo pacman -S --needed virtualbox

# Host modules
sudo pacman -S --needed virtualbox-host-modules-arch
#______________________________________________________________________________
