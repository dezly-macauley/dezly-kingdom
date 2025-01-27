# File Explorer and External Drives

To view the drives listed in your system:
```bash
lsblk
```

You will get an output that looks like this:

```bash
❯ lsblk
NAME      MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda         8:0    0 931.5G  0 disk
└─sda1      8:1    0 931.5G  0 part /run/media/dezlymacauley/4C55-F255
zram0     254:0    0   3.7G  0 disk [SWAP]
nvme0n1   259:0    0 238.5G  0 disk
├─nvme0n1p1
│         259:1    0   512M  0 part /boot
└─nvme0n1p2
          259:2    0   238G  0 part /
```

**Note: For clarity, the external drive is sda1**

---

How to check the file type of an external drive:

```bash
sudo blkid /dev/sda1
```

From the output, you can see that the type of this drive is exFat:

```bash
❯ sudo blkid /dev/sda1
[sudo] password for dezlymacauley:
/dev/sda1: UUID="4C55-F255" BLOCK_SIZE="512" 
TYPE="exfat" PARTUUID="4f329cd2-b5e8-4195-9e74-08bb0852983a"
```

---

### How to format a drive to Ext4?

What is Ext4? (Fourth Extended Filesystem)

It is the most common filesystem on Linux

---

To format a drive to ext4, first unmount the drive:
```bash
sudo umount /dev/sda1
```

---

Then format it:
```bash
sudo mkfs.ext4 /dev/sda1
```

---

After formatting assign a new UUID to the partion:

```bash
sudo tune2fs /dev/sda1 -U $(uuidgen)
```

---

You can also label the partition to make it easier to identify:

```bash
sudo e2label /dev/sda1 name-of-label-you want
```

E.g.
```bash
sudo e2label /dev/sda1 seagate-900gb
```
---

The drive should automatically mount itself.

Add permissions so that the drive can be accessed:

```
sudo chmod -R ugo+rwx /run/media/dezlymacauley/seagate-900gb/
```

---

