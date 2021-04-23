# [Installation guide](https://wiki.archlinux.org/index.php/installation_guide) - Arch Linux

### Set the keyboard layout

```bash
# ls /usr/share/kbd/keymaps/**/*.map.gz
```

### Verify the boot mode

```bash
# ls /sys/firmware/efi/efivars
```

### Connect to the internet

```bash
# ip link
```

```bash
# ping archlinux.org
```

### Update the system clock

Use [timedatectl(1)](https://jlk.fjfi.cvut.cz/arch/manpages/man/timedatectl.1) to ensure the system clock is accurate:

```bash
# timedatectl set-ntp true
```

To check the service status, use `timedatectl status`.

### Partition the disks

```bash
# fdisk -l
```

```bash
# cfdisk
```

### Format the partitions

Once the partitions have been created, each must be formatted with an appropriate [file system](https://wiki.archlinux.org/index.php/File_system). For example, if the root partition is on `/dev/sd*X*1` and will contain the Ext4 file system, run:

```bash
# mkfs.ext4 /dev/sda1
```

```bash
# mkfs.ext4 /dev/sda3 
```

```bash
# mkswap /dev/sda2
# swapon /dev/sda2
```

### Mount the file systems

```bash
# mount /dev/sdX1 /mnt
```

## Installation

### Install essential packages

```bash
# pacstrap /mnt base linux linux-firmware
```

## Configure the system

### Fstab

```bash
# genfstab -U /mnt >> /mnt/etc/fstab
```

### Chroot

```bash
# arch-chroot /mnt
```

### Time zone

```bash
# ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
```

```bash
# hwclock --systohc
```

### Localization

```bash
# locale-gen
```

```bash
/etc/locale.conf
LANG=en_US.UTF-8
```

```bash
/etc/vconsole.conf
KEYMAP=de-latin1
```

### Network configuration

```bash
/etc/hostname
myhostname
```

```bash
/etc/hosts
127.0.0.1	localhost
::1		localhost
127.0.1.1	myhostname.localdomain	myhostname
```

### Initramfs

```bash
# mkinitcpio -P
```

### Root password

```bash
# passwd
```

### Add User
```bash
# useradd -m -g users -G wheel username
```
```bash
# passwd username
```

#### Sudo

```bash
# which sudo
```

### Boot loader

Choose and install a Linux-capable [boot loader](https://wiki.archlinux.org/index.php/Boot_loader). If you have an Intel or AMD CPU, enable [microcode](https://wiki.archlinux.org/index.php/Microcode) updates in addition.

```bash
pacman -S grub efibootmgr dosfstools os-prober mtools
```

```bash
mkdir /boot/EFI
```

```bash
mount /dev/sda1 /boot/EFI
```

```bash
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
```



## Reboot

Exit the chroot environment by typing `exit` or pressing `Ctrl+d`.

Optionally manually unmount all the partitions with `umount -R /mnt`: this allows noticing any "busy" partitions, and finding the cause with [fuser(1)](https://jlk.fjfi.cvut.cz/arch/manpages/man/fuser.1).

Finally, restart the machine by typing `reboot`: any partitions still mounted will be automatically unmounted by *systemd*. Remember to remove the installation medium and then login into the new system with the root account.

## Post-installation

See [General recommendations](https://wiki.archlinux.org/index.php/General_recommendations) for system management directions and post-installation tutorials (like setting up a graphical user interface, sound or a touchpad).

For a list of applications that may be of interest, see [List of applications](https://wiki.archlinux.org/index.php/List_of_applications).