# Virtual Machine Guide
_______________________________________________________________________________
## Step 1 - Check if your system can run virtualization technology

Use this command:
```
egrep -c '(vmx|svm)' /proc/cpuinfo
```
- vmx indicates Intel's virtualization technology (VT-x).

- svm indicates AMD's virtualization technology (AMD-Vi).

If you get a number like `16`, that means you can run virtual machines
on your system and that you have 16 CPU cores.
_______________________________________________________________________________

An alternate command is this:
```
lscpu | grep -i Virtualization
```

I get an output like this:

Virtualization:                       VT-x

_______________________________________________________________________________

If the number is 0 then that means that you can't run virtualization
technology OR you can, but you need to enable it in your BIOS

Its usually a setting that says `enable virtualization`

NOTE: It's technically a UEFI but in people still call it BIOS. 
It's that menu that you get when you laptop is starting and you press F12.

_______________________________________________________________________________
## Step 2 - Install the packages needed for working with Virtual Machines

```sh
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
```


_______________________________________________________________________________
## Step 3 - Configure the `libvirt daemon`

The libvirt daemon is responsible for managing virtual machines 
and other virtualization technologies on Linux.

By editing the file, you can change the permissions and group ownership
for the Unix socket that libvirt uses for communication.

Open this file:
```sh
sudo nvim /etc/libvirt/libvirtd.conf
```
_______________________________________________________________________________

Look for these lines in the file:

This setting determines which group is allowed to access the Unix socket 
used by libvirt for communication. 

By default, this is commented out and the socket is restricted to root.
```ini
# This is restricted to 'root' by default
# unix_sock_group = "libvirt"
```

Uncomment the last line so it looks like this:
```ini
# This is restricted to 'root' by default
unix_sock_group = "libvirt"
```

This allows non-root users who are in the libvirt group to interact 
with libvirt and manage virtual machines (VMs), 
without needing full root privileges.

NOTE: You will add your Arch Linux username to this later in this guide.

_______________________________________________________________________________
Next look for the following lines:
```ini
# If not using PolicyKit and setting group ownership for access
# control, then you may want to relax this too.
# unix_sock_rw_perms = "0770"
```

Uncomment the last line so it looks like this:
```ini
# If not using PolicyKit and setting group ownership for access
# control, then you may want to relax this too.
unix_sock_rw_perms = "0770"
```

This setting defines the read-write permissions for the libvirt Unix socket. 
- 0: No permissions for others (world).
- 7: Full permissions (read, write, execute) for the owner (user root).
- 7: Full permissions for the group (users in the libvirt group).

_______________________________________________________________________________
Once you have done both of the above, 
save the file.

_______________________________________________________________________________
## Step 4 - Add your user to the groups `KVM` and `libvirt`

```sh
sudo usermod -a -G kvm,libvirt $(whoami)
```

`-a` means that the user should be appended to the group.
Without this flag the command will replace all other existing users in the
group.

`-G` kvm,libvirt

kvm: The kvm group grants access to virtualization-related tasks. 
Specifically, users in the kvm group are allowed to run virtual machines 
with KVM (Kernel-based Virtual Machine) capabilities.

libvirt: The libvirt group is used to manage access to libvirt, 
a virtualization API that interfaces with hypervisors like KVM. 
Adding your user to this group allows you to manage virtual machines 
with libvirt (via tools like virt-manager).
_______________________________________________________________________________
## Step 5 - Enable the `libvirt daemon` at startup and start the service

This is ensure that the service automatically loads at boot:
```sh
sudo systemctl enable libvirtd
```

This will start the service now:
```sh
sudo systemctl start libvirtd
```
_______________________________________________________________________________
## Step 6 - Ensure that you can start virtual machines with your own user

Without this step you will have to use the root user every time you want to
start a virtual machine.

Open qemu.conf:
```
sudo nvim  /etc/libvirt/qemu.conf
```

Search for the follwing lines:
```sh
## Some examples of valid values are:
#       user = "qemu" # A user named "qemu"
#       user = "+0" # Super user (uid=0)
#       user = "100" # A  user named "100" or a user with a uid=100
# user = "libvirt-qemu"
```
Uncomment the last line, and enter your user name so that it looks like this:
```sh
## Some examples of valid values are:
#       user = "qemu" # A user named "qemu"
#       user = "+0" # Super user (uid=0)
#       user = "100" # A  user named "100" or a user with a uid=100
user = "dezly-macauley"
```
_______________________________________________________________________________
Next search for the lines:
```sh
# The group for QEMU processess run by the system instance.
# It can be specified in a similar way to user.
# group = "libvirt-qemu"
```

Uncomment these lines so that it looks like this:
```sh
# The group for QEMU processess run by the system instance.
# It can be specified in a similar way to user.
group = "dezly-macauley"
```
_______________________________________________________________________________
Save the file and restart the libvirt daemon:

```sh
sudo systemctl restart libvirtd
```
_______________________________________________________________________________
## Step 7 - Ensure that your virtual machines have a network connection

```sh
sudo virsh net-autostart default
```
_______________________________________________________________________________
### Reboot your system
_______________________________________________________________________________
## Step 8 - Download a pre-built Kali Linux Virtual Machine

Go to this link:
```
https://www.kali.org/get-kali/#kali-virtual-machines
```

Download the `QEMU` one

It will look something like this:
```
https://cdimage.kali.org/kali-2024.4/kali-linux-2024.4-qemu-amd64.7z
```
_______________________________________________________________________________
## Step 9 - Create a `virtual-machines` directory in your home directory

```
cd ~
mkdir virtual-machines
```

And put the downloaded file inside the `virtual-machines` directory
```bash
~/virtual-machines
❯ ls
kali-linux-2024.4-qemu-amd64.7z
```

_______________________________________________________________________________
Since this is a pre-built virtual machine, 
you'll want to extract the archive using a tool like `7z`

```sh
cd virtual-machines
7z x kali-linux-2024.4-qemu-amd64.7z
```

After doing that you should have a `.qcow2` file

```
kali-linux-2024.4-qemu-amd64.7z
kali-linux-2024.4-qemu-amd64.qcow2
```

You can delete the `.7z` file

_______________________________________________________________________________
## Step 10 - Open the `Virtual Machine Manager` program

You should see `QEMU/KVM` listed. 

Click on it and make sure that it is connected.

<img src="./images/01.png" width="500" height="200" />

If `QEMU/KVM` is not listed for some reason.

Click `File`, then click on `Add Connection` and select `QEMU`

_______________________________________________________________________________
## Step 11 - Create a virtual machine pool

Click `File`, then click `New Virtual Machine`

Then select the option `Import existing disk image`

<img src="./images/02.png" width="500" height="400" />

Then click `Forward`

_______________________________________________________________________________
Click `Browse`

<img src="./images/03.png" width="500" height="400" />

_______________________________________________________________________________
Click the plus icon right at the bottom row. 

It's should display the text `Add Pool` if you hover over it.
<img src="./images/04.png" width="500" height="400" />

_______________________________________________________________________________

Change the `Name` field to `virtual-machines`

And change the `Target Path` to where the `virtual-machines` 
directory is saved on your system.

<img src="./images/05.png" width="500" height="400" />

Click `Finish`

_______________________________________________________________________________

You should see the `virtual-machines` directory and your
pre-built kali-linux machine listed under `Volumes`

<img src="./images/06.png" width="500" height="400" />

Click the kali-linux machine and then click `Choose Volume`

_______________________________________________________________________________
You will be taken back to this menuu

Where it says `choose the operating system you are installing`

You will notice that if you search for `Kali Linux` nothing will show up.

Most VM emulators will fail to automatically detect Kali because Kali Linux,
because Kali is actually a spin-off / fork of Linux distro called `Debian`.

To be even more specific, Kali Linux is based of the `testing` branch of Debian

So select `Debian testing`

<img src="./images/07.png" width="500" height="400" />

Then click `Forward`

_______________________________________________________________________________
I use this for memory and CPU settings:

- Memory: 3072 Mib
- CPUs:   2 CPU

<img src="./images/08.png" width="500" height="400" />

Click `Forward`

_______________________________________________________________________________

Rename the virtual machine. 

I call mine `kali-linux-tcm-sec` as 
I will be using this to study ethical hacking from TCM Security.

<img src="./images/09.png" width="500" height="400" />

Click `Finish`

_______________________________________________________________________________
