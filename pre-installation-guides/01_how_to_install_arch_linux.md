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
