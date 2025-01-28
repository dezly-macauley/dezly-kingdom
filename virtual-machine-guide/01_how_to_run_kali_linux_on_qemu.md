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
## Step 2 - Install the packages needed for QEMU 

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



















## Step 2 - Create a default network

Run this command:
```sh
echo '<network>
  <name>default</name>
  <bridge name="virbr0" stp="on" delay="0"/>
  <ip address="192.168.122.0" netmask="255.255.255.0">
    <dhcp>
      <range start="192.168.122.2" end="192.168.122.254"/>
    </dhcp>
  </ip>
</network>' | sudo tee /etc/libvirt/qemu/networks/default.xml > /dev/null
```

_______________________________________________________________________________

Then make sure to define the network
```sh
sudo virsh net-define /etc/libvirt/qemu/networks/default.xml
```

_______________________________________________________________________________

Run this command to check if it being detected:
```sh
sudo virsh net-list --all
```

The output should look like this:

```sh
 Name      State      Autostart   Persistent
----------------------------------------------
 default   inactive   no          yes
```

_______________________________________________________________________________
## Step 3 - Create start and stop functions in your `.zshrc`

Open your `.zshrc` file and add the following to the file:

```sh
function vm_services_start() {
    sudo systemctl start libvirtd.socket libvirtd-ro.socket libvirtd-admin.socket
    sudo systemctl start libvirtd dnsmasq iptables
    echo "libvirt, dnsmasq, and iptables services have been started."
    echo "You can now use Virtual Machine Manager to create and run VMs"
}

function vm_services_stop() {
    sudo systemctl stop libvirtd.socket libvirtd-ro.socket libvirtd-admin.socket
    sudo systemctl stop libvirtd dnsmasq iptables
    echo "libvirt, dnsmasq, and iptables services have been stopped."
}
```
_______________________________________________________________________________
Open the terminal and run the `vm_services_start` function like this:
```sh
vm_services_start
```

The purpose of these functions is to allow you to disable the virtual
machine functionality on your system when you are not using a virtual machine,
and to re-activate those services when you need to use a virtual machine.

_______________________________________________________________________________
Run this command to check if the network is active:
```sh
sudo virsh net-list --all
```

_______________________________________________________________________________
## Step 4 - Download a pre-built Kali Linux Virtual Machine

```
https://www.kali.org/get-kali/#kali-virtual-machines
```

Download the `QEMU` one

It will look something like this:
```
https://cdimage.kali.org/kali-2024.4/kali-linux-2024.4-qemu-amd64.7z
```
_______________________________________________________________________________
## Step 5 - Create a directory in your home directory called `virtual-machines`

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
## Step 6 - Open the `Virtual Machine Manager` program

You should see `QEMU/KVM` listed. 

Click on it and make sure that it is connected.

<img src="./images/01.png" width="1000" height="400" />

If `QEMU/KVM` is not listed for some reason.

Click `File`, then click on `Add Connection`

_______________________________________________________________________________
## Step 7 - Create a virtual machine pool

Click `File`, then click `New Virtual Machine`

<img src="./images/02.png" width="500" height="400" />

Click `Forward`

_______________________________________________________________________________

Click `Browse`

<img src="./images/03.png" width="500" height="400" />

_______________________________________________________________________________

Click the plus icon right at the bottom. 

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
You will be taken back to the `Create a new virtual machine` menu

Where it says `choose the operating system you are installing`

**Uncheck** the option that says `Automatically detect from the installation media / source`

Most VM emulators will fail to automatically detect Kali because Kali Linux,
because Kali is actually a spin-off / fork of Linux distro called `Debian`.

To be even more specific, Kali Linux is based of the `testing` branch of Debian

_______________________________________________________________________________

So click the menu and select `Debian testing`, then select `Forward`

<img src="./images/07.png" width="500" height="400" />

_______________________________________________________________________________

If you get a message like this, just click `Yes`

<img src="./images/08.png" width="500" height="400" />

_______________________________________________________________________________

`Choose Memory and CPU setting`

- Memory: 3072 Mib
- CPUs:   2 CPU

<img src="./images/09.png" width="500" height="400" />

Click `Forward`

_______________________________________________________________________________

- Make sure that `Enable storage for this virtual machine` is **checked**

- Check the option that says create `custom storage`

<img src="./images/10.png" width="500" height="400" />

Click `Manage`

_______________________________________________________________________________
Click the plus icon that is next to `Volumes`.

It should say `Create new volume`

<img src="./images/06.png" width="500" height="400" />

_______________________________________________________________________________

Give it a name, and about `60GB` that is allocated immediately

<img src="./images/11.png" width="500" height="400" />

Click `Finish`

_______________________________________________________________________________
Make sure to select the `qcow2` volume that you created. 

**Do not select the raw!**

<img src="./images/12.png" width="500" height="400" />

Then click `Choose Volume`

_______________________________________________________________________________
You will be taken back to this screen. 

Click `Forward`

<img src="./images/13.png" width="500" height="400" />

_______________________________________________________________________________

Select or create custom storage:

Chose the virtual-machines directory again

Click the + (add new volumes)

Name: kali-linux
Capacity: 50 GB

Choose the volume

_______________________________________________________________________________
