# 🏰 Dezly Kingdom
_______________________________________________________________________________
## About

My digital kingdom that uses the following technologies at the foundation:

- **Arch Linux** - Operating System
- **Hyprland** - Window Manager
- **Neovim** - Code Editor
- **QEMU** - For running Kali Linux Virtual Machines

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

Dezly's Recommendation: `01_install_dezly_kingdom.sh` is simply a script 
that runs all of the scripts inside the directory `~/.dezly-kingdom/scripts/`

Please have a look at the scripts inside that directory to see what programs
and packages are being installed because you may need certain programs or
certain scripts.

```
chmod +x ~/.dezly-kingdom/01_install_dezly_kingdom.sh
chmod +x ~/.dezly-kingdom/scripts/*.sh
./01_install_dezly_kingdom.sh
```

_______________________________________________________________________________
### Post Installation: Zsh First Time Setup

```
chmod +x ~/.dezly-kingdom/02_zsh_first_time_setup.sh
cd $HOME/.dezly-kingdom
./02_zsh_first_time_setup.sh
```

_______________________________________________________________________________
### Post Installational Maintenance

#### How to update your entire system

```
paru -Syu
```
This command will do the following:
1. Update packages that were installed using `pacman` (regular packages)
2. Update packages that were installed `paru` (AUR packages)

_______________________________________________________________________________
#### WARNING

Do NOT use `pacman -Syu` because this will not update AUR packages!

_______________________________________________________________________________
#### How to uninstall packages

To unistall a program that was installed by pacman:
```
paru -Rns name-of-package
```

To unistall a program that was installed by Paru (I.e. An AUR package):
```
paru -Rns name-of-package
```
_______________________________________________________________________________
#### To see what tools you have installed wih uv:
```
uv tool list
```
_______________________________________________________________________________
#### To unistall a tool that was installed with uv:

```
uv tool unistall name-of-tool
```

_______________________________________________________________________________
