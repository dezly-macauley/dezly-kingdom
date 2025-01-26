# First Login Tasks
_______________________________________________________________________________
### Update your package manager

This will let your package manager know about any new packages that have 
been released in the Debian repo. Your current package list will only include
the packages that were available when your ISO image was released.
```
sudo apt update
```

_______________________________________________________________________________
### Update your system

To see what packages are out of date, run the following command:
```
sudo apt list --upgradable
```

To update your system with full dependency resolution (removing packages
and dependencies that your system does not need to avoid conflicts).
```
sudo apt full-upgrade -y
```
_______________________________________________________________________________
### Install and Remove Programs

How to search for a package in Kali

```
sudo apt search name-of-your-package
```

_______________________________________________________________________________

### How to install a package in Kali

There are two ways

Method 1: This is for interactive package installs (manually entering the
commands in the terminal).
This has some visual stuff like a progress bar. 
```
sudo apt install name-of-your-package
```

Method 2: This does the same thing but it is better suited when you want
to add this command as part of a bash script.
This doesn't have all of the fancy progress bar stuff because it is meant for
scripts.
```
sudo apt-get install name-of-your-package
```
_______________________________________________________________________________

## Packages to Install

First make sure that your package manager is updated
```
sudo apt update
```

#### Software Bundles

#### Code Editor

#### Configuration Management

_______________________________________________________________________________
