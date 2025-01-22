# How to install Arch Linux
_______________________________________________________________________________
## Go to this site and select the image that you want to download

https://archlinux.org/download/#download-mirrors
_______________________________________________________________________________
Select a mirror: I like to use the `United Kingdom`,
specifically `allworldit.com`

https://archlinux.uk.mirror.allworldit.com/archlinux/iso/2024.12.01/
_______________________________________________________________________________
## Download the ISO image and the ISO signature file:

The ISO image will look like this:
```
archlinux-2024.12.01-x86_64.iso
```

The ISO signature will look like this:

```
archlinux-2024.12.01-x86_64.iso.sig
```

_______________________________________________________________________________
## Verify the Signature

https://archlinux.org/download/#checksums

Go to `Checksums and signatures` 

You will also need to install a program called `Gnu Privacy gaurd`

This program is usually available for download as `gnupg`

so that you can use the `gpg` command:

Make sure that the iso image and the iso signature are in the same directory and then run this command.

using GnuPG, download the signing key from WKD
```
gpg --auto-key-locate clear,wkd -v --locate-external-key pierre@archlinux.org
```

Then run this command:
```
gpg --keyserver-options auto-key-retrieve --verify archlinux-2024.12.01-x86_64.iso.sig archlinux-2024.12.01-x86_64.iso
```

`Good signature from "Pierre Schmitz <pierre@archlinux.org>" `

_______________________________________________________________________________
## Verify the checksum

https://archlinux.org/download/

Go to Checksums and signatures click this:

```
sha256sums.txt
```

Something like this should open up in the browser:

```
56b246d1a569f1670c0f98198f5c9a32558d54d010cd3434356cc1e20ad97945  archlinux-2024.12.01-x86_64.iso
56b246d1a569f1670c0f98198f5c9a32558d54d010cd3434356cc1e20ad97945  archlinux-x86_64.iso
13f3bbdf447c1e67cd812f008e439ec007e84cdd6c9e1f197bb3bba7a0ae6070  archlinux-bootstrap-2024.12.01-x86_64.tar.zst
13f3bbdf447c1e67cd812f008e439ec007e84cdd6c9e1f197bb3bba7a0ae6070  archlinux-bootstrap-x86_64.tar.zst
```

You will need to have a program called `sha256sum` to run the command below:

```
sha256sum name_of_iso_image.iso
```

Check if the ouput matches the one in `sha256sums.txt` 

56b246d1a569f1670c0f98198f5c9a32558d54d010cd3434356cc1e20ad97945  archlinux-2024.12.01-x86_64.iso
56b246d1a569f1670c0f98198f5c9a32558d54d010cd3434356cc1e20ad97945  archlinux-2024.12.01-x86_64.iso
_______________________________________________________________________________

### Check how much RAM you have available

```
free -h
```

Look at the column that says available:

```
availble
4.7 Gi
```

This means that I can give my virtual machine 3.5 GB of RAM while running my 
main operating system. Don't use the entire amount

(1 GB = 1024 MiB) 

So 3.5GiB (gibibytes) = 3584 MiB (Mebibytes)

_______________________________________________________________________________

### How to check how many cores you have

```
cat /proc/cpuinfo | grep processor | wc -l
```
You have 8 logical processors. 
This typically means you have 8 threads, 
which could correspond to 4 physical cores with hyper-threading 
(if your CPU supports it).

_______________________________________________________________________________

## Check if you can run virtualization technology

Use this command:
```
egrep -c '(vmx|svm)' /proc/cpuinfo
```
vmx indicates Intel's virtualization technology (VT-x).
svm indicates AMD's virtualization technology (AMD-V).

If the number is 0 then that means that you can't run virtualization
technology OR you can, but you need to enable it in your BIOS

Its usually a setting that says `enable virtualization`

NOTE: It's technically a UEFI but in people still call it BIOS. 
It's that menu that you get when you laptop is starting and you press F12.

If you get a number like `16`, that means you can run virtual machines
on your system and that you have 16 CPU cores.

_______________________________________________________________________________

So this means I have 16 processors on my machine.

8 cores, and each core can handle 2 threads. So 8 x 2 = 16

So this means that I can give the virtual machine 4 cpus

_______________________________________________________________________________

```
df -h
```

Space I will make the VM 60GB of hardrive space

_______________________________________________________________________________

Create a directory in your home directory called `virtual-machines`

```
cd ~
mkdir virtual-machines
```

Put the Arch ISO image inside the the virtual-machines 
_______________________________________________________________________________

## Check if libvirtd is enabled after installing it

```
systemctl status libvirtd
```

If it is not enabled:

```
sudo systemctl enable libvirtd
sudo systemctl start libvirtd
```
_______________________________________________________________________________
## Open the Virtual Machine Manager GUI

You should see `QEMU/KVM` listed

File > New Virtual Machine

Local install media (ISO image)

Click Browse

There is a column on the left that has something called `default`

Below that, click the blue plus icon at the bottom.
Its the one that says "Add pool"

You will get a menu that says "Create storage pool"

For the name: virtual-machines

Leave the type as `dir: Filesystem Directory`

Target Path: Select the virtual-machines directory

Then click `Finish`

Now select virtual-machines, and select the kali-linux ISO image

Tip: If you don't see the ISO image, Virtual Machine Manager and try again

Then click `Choose volume`

Arch Linux should be there

_______________________________________________________________________________

Memory:
So 3.5GiB (gibibytes) = 3584 MiB (Mebibytes)

CPUs:
4

_______________________________________________________________________________

Make sure the box `Enable storage for this virtual machine is checked`

Then click `select or create custom storage`

Right next to `Volumes` click the blue `+` button that says

```
create new volume
```

Name: arch-linux
Format: qcow2

Capacity: 60 GB

Make sure to leave `Allocate entire volume now` as unchecked

_______________________________________________________________________________

Click the virtual machine:

```
arch-linux.qcow2
```

Then click `Choose volume`

Name: arch-linux

Network selection:

```
Virtual network 'default': NAT
```
_______________________________________________________________________________

This should launch into Arch:

Now to install it

```
archinstall
```

_______________________________________________________________________________

Select Language: English (100%)

Use space and enter to select options

_______________________________________________________________________________

Locales:

keyboard layout: us

Locale language: en_GB

Locale encoding: UTF-8

_______________________________________________________________________________

Mirror region:

United Kingdom
_______________________________________________________________________________
Disk configuration

Partitioning > Use best-effort default partition layout

File system: ext4

_______________________________________________________________________________

Encrypt with `LUKS`

_______________________________________________________________________________

Swap: Yes
_______________________________________________________________________________

Bootloader: GRUB

_______________________________________________________________________________

Hostname:

```
arch-linux
```

_______________________________________________________________________________

Create a user and make them a super user

```
dezly-macauley
```
_______________________________________________________________________________

Audio: Pipewire

_______________________________________________________________________________

Network configuration:

Use `Network Manager`

_______________________________________________________________________________

Optional repositories:

Multilib

_______________________________________________________________________________

Timezone: Europe/Athens

_______________________________________________________________________________

Would you like to chroot into the newly created installation and perform
post-install configuration?

Click No
_______________________________________________________________________________


```
shutdown now
```
_______________________________________________________________________________



# Installing Arch (Linux)

When you boot into Arch Linux from your bootable drive, 
your prompt will look like this:

```
root@archisto ~#
```

## Step 1: Set your keyboard layout and increase terminal fonts size

Set custom keyboard layout:
```
loadkeys mod-dh-matrix-us
```

Increase terminal font:
```
setfont ter-132b
```

---

## Step 2: Setup your Wifi internet connection

Enter the the Wifi setup prompt:
```
iwctl
```

After running that command, your terminal prompt will now look like this:
```
[iwd]#
```

Next run this command:
```
device list
```

This will show your Wifi devices. You should see something like "wlan0"

---

**NOTE:**

"wlan0" is the name of the device that I will be using in this guide.
Replace "wlan0" with the name of your device.

---

Check if the your device is powered on. To switch on the device if it is off,
type the following:
```
device wlan0 set-property Powered on
```

Enable searching for Wifi networks:
```
station wlan0 scan
```

Get a list of Wifi Networks that you can connect to:
```
station wlan0 device get-networks
```

To connect to a specific the Wifi network on the list:

**Note: Include the double quotes when you enter the name**

```
station wlan0 connect "name of the network"
```

E.g. 
```
station wlan0 connect "Hidden Rain Wifi"
```

You will be prompted for the password of that Wifi network.

After you have entered that, your prompt will go back to looking like this:
```
[iwd]#
```

Type the following to get back to installing Linux:
```
exit
```

Now your prompt should be back to this:

```
root@archiso ~ #
```

To check that you are connected to the internet:
```
ping google.com
```

If you start seeing messages being repeated,
then that means that you are connected to the internet.

To exit this infinite loop, use these two keys: 
```
Press Ctrl+c
```

---

## Step 3: Enter the guided Arch installer

You should be starting off with a prompt that looks like this:
```
root@archiso ~#
```

Run this command to start the installer:
```
archinstall
```

You will be taken to a guided menu that reads:
```
Set/Modify the below options:
```

I will walk you through what to do for each option:

---

**Arch Install language:**
```
Leave this as English (100%)
```

---

**Mirrors:**
```
Leave this alone
```

---

**Locales:**

**Keyboard Layout**
```
Choose mod-dh-matrix
```

Tip: press the "/" key to use the search functionality

**Locales lanaguage:**
```
Choose en_GB.UTF-8
```

---

**Locales encoding:**
```
Choose UTF-8
```

---

**Disk Configuration:**

**Select a partitioning option:**
```
Choose the one that says

"Use a best-effort default partion layout"
```

---

**Select one or more devices to use and configure:**
```
Select the one with the most space in GB. 
That is your hardrive.

It will usually be something like: "dev/nvme01n1"
```

---

**Select which filestystem your main partion should use:**
```
Don't over-complicate things...

Choose "ext4"

```

---

**Would you like to create a seperate partition for "/home"?**
```
Choose "no"
```

---

**Disk encryption:**
```
Again don't complicate things..

Skip this
```
---

**Bootloader:**
```
Leave this as "systemd-boot"

```

Whenever you hear Arch users talking about a broken boot,
"grub" always seems to be somewhere in the conversation....

---

**Unified kernel images: false**

Would you like to use unified kernel images?
```
Choose "no"
```

---

**Hostname:**
```
Leave this as "archlinux"
```

---

**Root password**
```
Skip this
```

---

**User account:**

Enter your username:
```
dezlymacauley
```

Enter a password (very slowly):

Re-enter the password again:

**Should "dezlymacauley" be a superuser (sudo)?**

```
Pick "yes (default)"
```

```
Select "Confirm and exit"
```

---

**Profile:**

Type:
```
Pick "Minimal"
```

I'd rather install Hyprland from scratch to avoid any un-needed packages.

---

**Audio** 

Choose an audio server:
```
Choose Pipewire
```

---

Kernels: 
```
Linux
```

Just regular linux. Again, don't overcomplicate things.

---

Additional packages:
```
Skip this
```

You want the installation to be as quick as possible.

---

**Network Configuration:**

```
Make sure to pick "Use NetworkManager"
```

Or you will may have issues after the installation,
if another Wifi is used in the future.

---

Timezone:

```
Use the search functionality to select "Europe/Athens"
```

---

Automatic time sync (NTP):

```
True
```

---

Optional Repositories:

```
Enable "multilib"
```

Leave everything else unchecked.

---

Scroll down to where it says "Install" and press Enter

---

When the installation is complete, you will see this:

Would you like to chroot into the newly created installation and perform,
post-install

```
Select "yes(default)"
```

---

Your terminal will now look like this:

```
[root@archisto/]#
```

Type the following:
```
exit
```

---

You should see a message that reads

"Installation completed without any errors.
You may now reboot"

Your terminal prompt will also look like this now:
```
root@archisto ~#
```

Shutdown your computer with the following command:
```
shutdown now
```

Once your computer is off, unplug your bootable drive.

---

## Step 4: Post-Install Internet setup

Switch your computer back on.

Your terminal prompt will now look like this:

```
archlinux login:
```

Enter your username and password.

---

Your terminal prompt should now look like this:
```
[dezlymacauley@archlinux ~]$
```

---

Now that you are logged in, use Network Manager to setup your internet:

```
nmtui
```

This is pretty intuitive. 
Just select the Wifi you want to connect to and press Enter

---
