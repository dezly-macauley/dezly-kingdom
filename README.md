# 🏰 Dezly Kingdom 
_______________________________________________________________________________
## About

My digital kingdom that uses the following technologies at the foundation:

- **Arch Linux** - Operating System
- **Hyprland** - Window Manager
- **Neovim** - Code Editor

_______________________________________________________________________________
## Technologies Used


_______________________________________________________________________________
## Requirements

#### Arch Linux must be installed on your system
- If you don't have Arch Linux installed on your system, 
follow the instructions at `01_how_to_install_arch_linux.md`

NOTE: The current guide is for installing Arch in a Virtual Machine but
the installation steps are similar for a bare metal installation.

#### Git must be installed and configured
- If you don't have git installed or configured on your system, 
follow the instructions at `02_how_to_install_and_configure_git.md`

#### WARNING: For users with NVIDIA graphics cards

Since `Dezly Kingdom` uses `Hyprland` you may have issues due 
to the propriety nature of Nvidia drivers.

Visit this link if you are having any issues
[Hyprland - Nvidia](https://wiki.hyprland.org/NVIDIA/)
_______________________________________________________________________________

## How to install `Dezly Kingdom`

Open your terminal and follow these steps:
_______________________________________________________________________________
### Step 1 - Clone this repository

```
git clone https://github.com/dezly-macauley/dezly-kingdom ~/.dezly-kingdom
```
_______________________________________________________________________________
### Step 2 - Make the installation script executable and run it

```
chmod +x ~/.dezly-kingdom/install_dezly_kingdom.sh
chmod +x ~/.dezly-kingdom/scripts/*.sh
./install_dezly_kingdom.sh
```

_______________________________________________________________________________
### Post Installational Maintenance

#### To view a list of all installed programs
```
pacman -Qe
```

_______________________________________________________________________________
#### To update all packages that pacman (The Arch Linux package manager)
installed on the system:
```
sudo pacman -Syu
```
_______________________________________________________________________________
#### To update all packages that paru (Arch User Repository) 
installed on the system:
```
paru -Syu
```
_______________________________________________________________________________
#### To update all packages that cargo (Rust) installed on the system:
```
???
```
_______________________________________________________________________________
#### To update all packages that npm (JavaScript) installed on the system:
```
npm update -g
```
_______________________________________________________________________________
