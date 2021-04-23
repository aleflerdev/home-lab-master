# Installation guide

# Contents

###### top

- 1Pre-installation
  - [1.1Verify signature](# Verify signature)
  - [1.2Boot the live environment](# Boot the live environment)
  - [1.3Set the keyboard layout](# Set the keyboard layout)
  - [1.4Verify the boot mode](# Verify the boot mode)
  - [1.5Connect to the internet](# Connect to the internet)
  - [1.6Update the system clock](# Update the system clock)
  - 1.7Partition the disks
    - [1.7.1Example layouts](# Example layouts)
  - [1.8Format the partitions](# Format the partitions)
  - [1.9Mount the file systems](# Mount the file systems)
- 2Installation
  - [2.1Select the mirrors](# Select the mirrors)
  - [2.2Install essential packages](# Install essential packages)
- 3Configure the system
  - [3.1Fstab](# Fstab)
  - [3.2Chroot](# Chroot)
  - [3.3Time zone](# Time zone)
  - [3.4Localization](# Localization)
  - [3.5Network configuration](# Network configuration)
  - [3.6Initramfs](# Initramfs)
  - [3.7Root password](# Root password)
  - [3.8Boot loader](# Boot loader)
- [4Reboot](# Reboot)
- [5Post-installation](# Post-installation)

## Pre-installation

The installation media and their [GnuPG](https://wiki.archlinux.org/index.php/GnuPG) signatures can be acquired from the [Download](https://www.archlinux.org/download/) page.

###### [Top](# Top)

### Verify signature

It is recommended to verify the image signature before use, especially when downloading from an *HTTP mirror*, where downloads are generally prone to be intercepted to [serve malicious images](https://www2.cs.arizona.edu/stork/packagemanagersecurity/attacks-on-package-managers.html).

On a system with [GnuPG](https://wiki.archlinux.org/index.php/GnuPG) installed, do this by downloading the *PGP signature* (under *Checksums* in the [Download](https://www.archlinux.org/download/) page) to the ISO directory, and [verifying](https://wiki.archlinux.org/index.php/GnuPG#Verify a signature) it with:

```
$ gpg --keyserver-options auto-key-retrieve --verify archlinux-version-x86 64.iso.sig
```

Alternatively, from an existing Arch Linux installation run:

```
$ pacman-key -v archlinux-version-x86 64.iso.sig
```

**Note:**

- The signature itself could be manipulated if it is downloaded from a mirror site, instead of from [archlinux.org](https://archlinux.org/download/) as above. In this case, ensure that the public key, which is used to decode the signature, is signed by another, trustworthy key. The `gpg` command will output the fingerprint of the public key.
- Another method to verify the authenticity of the signature is to ensure that the public key's fingerprint is identical to the key fingerprint of the [Arch Linux developer](https://www.archlinux.org/people/developers/) who signed the ISO-file. See [Wikipedia:Public-key cryptography](https://en.wikipedia.org/wiki/Public-key cryptography) for more information on the public-key process to authenticate keys.

### Boot the live environment

The live environment can be booted from a [USB flash drive](https://wiki.archlinux.org/index.php/USB flash installation medium), an [optical disc](https://wiki.archlinux.org/index.php/Optical disc drive#Burning) or a network with [PXE](https://wiki.archlinux.org/index.php/PXE).

- Pointing the current boot device to a drive containing the Arch installation medium is typically achieved by pressing a key during the [POST](https://en.wikipedia.org/wiki/Power-on self test) phase, as indicated on the splash screen. Refer to your motherboard's manual for details.
- When the Arch menu appears, select *Arch Linux install medium* and press `Enter` to enter the installation environment.
- See [README.bootparams](https://gitlab.archlinux.org/archlinux/archiso/-/blob/master/docs/README.bootparams) for a list of [boot parameters](https://wiki.archlinux.org/index.php/Kernel parameters#Configuration), and [packages.x86 64](https://gitlab.archlinux.org/archlinux/archiso/-/blob/master/configs/releng/packages.x86 64) for a list of included packages.
- You will be logged in on the first [virtual console](https://en.wikipedia.org/wiki/Virtual console) as the root user, and presented with a [Zsh](https://wiki.archlinux.org/index.php/Zsh) shell prompt.

To switch to a different console—for example, to view this guide with [ELinks](https://wiki.archlinux.org/index.php/ELinks) alongside the installation—use the `Alt+*arrow*` [shortcut](https://wiki.archlinux.org/index.php/Keyboard shortcuts). To [edit](https://wiki.archlinux.org/index.php/Textedit) configuration files, [nano](https://wiki.archlinux.org/index.php/Nano#Usage) and [vim](https://wiki.archlinux.org/index.php/Vim#Usage) are available.

### Set the keyboard layout

The default [console keymap](https://wiki.archlinux.org/index.php/Console keymap) is [US](https://en.wikipedia.org/wiki/File:KB United States-NoAltGr.svg). Available layouts can be listed with:

```
# ls /usr/share/kbd/keymaps/**/*.map.gz
```

To modify the layout, append a corresponding file name to [loadkeys(1)](https://jlk.fjfi.cvut.cz/arch/manpages/man/loadkeys.1), omitting path and file extension. For example, to set a [German](https://en.wikipedia.org/wiki/File:KB Germany.svg) keyboard layout:

```
# loadkeys de-latin1
```

[Console fonts](https://wiki.archlinux.org/index.php/Console fonts) are located in `/usr/share/kbd/consolefonts/` and can likewise be set with [setfont(8)](https://jlk.fjfi.cvut.cz/arch/manpages/man/setfont.8).

###### [Top](# Top)

### Verify the boot mode

[Archiso](https://wiki.archlinux.org/index.php/Archiso) uses [systemd-boot](https://wiki.archlinux.org/index.php/Systemd-boot) for booting in UEFI mode and [syslinux](https://wiki.archlinux.org/index.php/Syslinux) for booting in BIOS mode.

To verify the boot mode, list the [efivars](https://wiki.archlinux.org/index.php/Unified Extensible Firmware Interface#UEFI variables) directory:

```
# ls /sys/firmware/efi/efivars
```

If the command shows the directory without error, then the system is booted in UEFI mode. If the directory does not exist, the system may be booted in [BIOS](https://en.wikipedia.org/wiki/BIOS) (or [CSM](https://en.wikipedia.org/wiki/Compatibility Support Module)) mode. If the system did not boot in the mode you desired, refer to your motherboard's manual.

###### [Top](# Top)

### Connect to the internet

To set up a network connection, go through the following steps:

- Ensure your

   

  network interface

   

  is listed and enabled, for example with

   

  [ip-link(8)](https://jlk.fjfi.cvut.cz/arch/manpages/man/ip-link.8)

  :

  ```
  # ip link
  ```

- For wireless, make sure the wireless card is not blocked with [rfkill](https://wiki.archlinux.org/index.php/Rfkill).

- Connect to the network:

  - Ethernet—plug in the cable.
  - Wi-Fi—authenticate to the wireless network using [iwctl](https://wiki.archlinux.org/index.php/Iwctl).

- Configure your network connection:

  - [DHCP](https://wiki.archlinux.org/index.php/DHCP): dynamic IP address and DNS server assignment (provided by [systemd-networkd](https://wiki.archlinux.org/index.php/Systemd-networkd) and [systemd-resolved](https://wiki.archlinux.org/index.php/Systemd-resolved)) should work out of the box for [wired](https://gitlab.archlinux.org/archlinux/archiso/-/blob/master/configs/releng/airootfs/etc/systemd/network/20-ethernet.network) and [wireless](https://gitlab.archlinux.org/archlinux/archiso/-/blob/master/configs/releng/airootfs/etc/systemd/network/20-wireless.network) network interfaces.
  - Static IP address: follow [Network configuration#Static IP address](https://wiki.archlinux.org/index.php/Network configuration#Static IP address).

- The connection may be verified with

   

  ping

  :

  ```
  # ping archlinux.org
  ```

**Note:** The installation image has `systemd-networkd.service`, `systemd-resolved.service` and `iwd.service` enabled by default. That will not be the case for the installed system.

###### [Top](# Top)

### Update the system clock

Use [timedatectl(1)](https://jlk.fjfi.cvut.cz/arch/manpages/man/timedatectl.1) to ensure the system clock is accurate:

```
# timedatectl set-ntp true
```

To check the service status, use `timedatectl status`.

###### [Top](# Top)

### Partition the disks

When recognized by the live system, disks are assigned to a [block device](https://wiki.archlinux.org/index.php/Block device) such as `/dev/sda`, `/dev/nvme0n1` or `/dev/mmcblk0`. To identify these devices, use [lsblk](https://wiki.archlinux.org/index.php/Lsblk) or *fdisk*.

```
# fdisk -l
```

Results ending in `rom`, `loop` or `airoot` may be ignored.

The following [partitions](https://wiki.archlinux.org/index.php/Partition) are **required** for a chosen device:

- One partition for the [root directory](https://en.wikipedia.org/wiki/Root directory) `/`.
- For booting in [UEFI](https://wiki.archlinux.org/index.php/UEFI) mode: an [EFI system partition](https://wiki.archlinux.org/index.php/EFI system partition).

If you want to create any stacked block devices for [LVM](https://wiki.archlinux.org/index.php/LVM), [system encryption](https://wiki.archlinux.org/index.php/Dm-crypt) or [RAID](https://wiki.archlinux.org/index.php/RAID), do it now.

#### Example layouts

| Mount point |   Partition   | [Partition type](https://en.wikipedia.org/wiki/Partition type) |     Suggested size      |
| :---------: | :-----------: | :----------------------------------------------------------: | :---------------------: |
|   `/mnt`    | `/dev/sd*X*1` |                            Linux                             | Remainder of the device |
|  `[SWAP]`   | `/dev/sd*X*2` |                          Linux swap                          |    More than 512 MiB    |

|        Mount point        |   Partition   | [Partition type](https://en.wikipedia.org/wiki/GUID Partition Table#Partition type GUIDs) |     Suggested size      |
| :-----------------------: | :-----------: | :----------------------------------------------------------: | :---------------------: |
| `/mnt/boot` or `/mnt/efi` | `/dev/sd*X*1` | [EFI system partition](https://wiki.archlinux.org/index.php/EFI system partition) |       260–512 MiB       |
|          `/mnt`           | `/dev/sd*X*2` |                    Linux x86-64 root (/)                     | Remainder of the device |
|         `[SWAP]`          | `/dev/sd*X*3` |                          Linux swap                          |    More than 512 MiB    |

See also [Partitioning#Example layouts](https://wiki.archlinux.org/index.php/Partitioning#Example layouts).

**Note:**

- Use [fdisk](https://wiki.archlinux.org/index.php/Fdisk) or [parted](https://wiki.archlinux.org/index.php/Parted) to modify partition tables, for example `fdisk /dev/sd*X*`.
- [Swap](https://wiki.archlinux.org/index.php/Swap) space can be set on a [swap file](https://wiki.archlinux.org/index.php/Swap file) for file systems supporting it.

###### [Top](# Top)

### Format the partitions

Once the partitions have been created, each must be formatted with an appropriate [file system](https://wiki.archlinux.org/index.php/File system). For example, if the root partition is on `/dev/sd*X*1` and will contain the Ext4 file system, run:

```bash
# mkfs.ext4 /dev/sda3
```
```bash
# mkfs.ext4 /dev/sda2
```
If you created a partition for [swap](https://wiki.archlinux.org/index.php/Swap), initialize it with [mkswap(8)](https://jlk.fjfi.cvut.cz/arch/manpages/man/mkswap.8):

```
# mkswap /dev/sdX1
# swapon /dev/sdX1
```

See [File systems#Create a file system](https://wiki.archlinux.org/index.php/File systems#Create a file system) for details.

###### [Top](# Top)

### Mount the file systems

[Mount](https://wiki.archlinux.org/index.php/Mount) the file system on the root partition to `/mnt`, for example:

```
# mount /dev/sda2 /mnt
```

```
# mount /dev/sda3 /mnt/home
```



Create any remaining mount points (such as `/mnt/efi`) using [mkdir(1)](https://jlk.fjfi.cvut.cz/arch/manpages/man/mkdir.1) and mount their corresponding partitions.

[genfstab](https://git.archlinux.org/arch-install-scripts.git/tree/genfstab.in) will later detect mounted file systems and swap space.

###### [Top](# Top)

## Installation

### Select the mirrors

Packages to be installed must be downloaded from [mirror servers](https://wiki.archlinux.org/index.php/Mirrors), which are defined in `/etc/pacman.d/mirrorlist`. On the live system, after connecting to the internet, [reflector](https://wiki.archlinux.org/index.php/Reflector) updates the mirror list by choosing HTTPS mirrors that have synchronized in the last hour and sorting them by download rate.[[1\]](https://gitlab.archlinux.org/archlinux/archiso/-/blob/master/configs/releng/airootfs/etc/systemd/system/reflector.service)

The higher a mirror is placed in the list, the more priority it is given when downloading a package. You may want to edit the file accordingly, and move the geographically closest mirrors to the top of the list, although other criteria should be taken into account.

This file will later be copied to the new system by *pacstrap*, so it is worth getting right.

###### [Top](# Top)

### Install essential packages

Use the [pacstrap](https://projects.archlinux.org/arch-install-scripts.git/tree/pacstrap.in) script to install the [base](https://www.archlinux.org/packages/?name=base) package, Linux [kernel](https://wiki.archlinux.org/index.php/Kernel) and firmware for common hardware:

```
# pacstrap /mnt base linux linux-firmware
```

**Tip:**

- You can substitute [linux](https://www.archlinux.org/packages/?name=linux) for a [kernel](https://wiki.archlinux.org/index.php/Kernel) package of your choice, or you could omit it entirely when installing in a [container](https://en.wikipedia.org/wiki/Container (virtualization)).
- You could omit the installation of the firmware package when installing in a virtual machine or container.

The [base](https://www.archlinux.org/packages/?name=base) package does not include all tools from the live installation, so installing other packages may be necessary for a fully functional base system. In particular, consider installing:

- userspace utilities for the management of [file systems](https://wiki.archlinux.org/index.php/File systems) that will be used on the system,
- utilities for accessing [RAID](https://wiki.archlinux.org/index.php/RAID) or [LVM](https://wiki.archlinux.org/index.php/LVM) partitions,
- specific firmware for other devices not included in [linux-firmware](https://www.archlinux.org/packages/?name=linux-firmware),
- software necessary for [networking](https://wiki.archlinux.org/index.php/Networking),
- a [text editor](https://wiki.archlinux.org/index.php/Text editor),
- packages for accessing documentation in [man](https://wiki.archlinux.org/index.php/Man) and [info](https://wiki.archlinux.org/index.php/Info) pages: [man-db](https://www.archlinux.org/packages/?name=man-db), [man-pages](https://www.archlinux.org/packages/?name=man-pages) and [texinfo](https://www.archlinux.org/packages/?name=texinfo).

To [install](https://wiki.archlinux.org/index.php/Install) other packages or package groups, append the names to the *pacstrap* command above (space separated) or use [pacman](https://wiki.archlinux.org/index.php/Pacman) while [chrooted into the new system](https://wiki.archlinux.org/index.php/installation guide#Chroot). For comparison, packages available in the live system can be found in [packages.x86 64](https://gitlab.archlinux.org/archlinux/archiso/-/blob/master/configs/releng/packages.x86 64).

## Configure the system

###### [Top](# Top)

### Fstab

Generate an [fstab](https://wiki.archlinux.org/index.php/Fstab) file (use `-U` or `-L` to define by [UUID](https://wiki.archlinux.org/index.php/UUID) or labels, respectively):

```
# genfstab -U /mnt >> /mnt/etc/fstab
```

Check the resulting `/mnt/etc/fstab` file, and edit it in case of errors.

###### [Top](# Top)

### Chroot

[Change root](https://wiki.archlinux.org/index.php/Change root) into the new system:

```
# arch-chroot /mnt
```

###### [Top](# Top)

### Time zone

Set the [time zone](https://wiki.archlinux.org/index.php/Time zone):

```bash
# ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
```

Run [hwclock(8)](https://jlk.fjfi.cvut.cz/arch/manpages/man/hwclock.8) to generate `/etc/adjtime`:

```
# hwclock --systohc
```

This command assumes the hardware clock is set to [UTC](https://en.wikipedia.org/wiki/UTC). See [System time#Time standard](https://wiki.archlinux.org/index.php/System time#Time standard) for details.

###### [Top](# Top)

### Localization

Edit `/etc/locale.gen` and uncomment `en US.UTF-8 UTF-8` and other needed [locales](https://wiki.archlinux.org/index.php/Locale). Generate the locales by running:

```
# locale-gen
```

Create the [locale.conf(5)](https://jlk.fjfi.cvut.cz/arch/manpages/man/locale.conf.5) file, and [set the LANG variable](https://wiki.archlinux.org/index.php/Locale#Setting the system locale) accordingly:

```
/etc/locale.conf
LANG=en US.UTF-8
```

If you [set the keyboard layout](https://wiki.archlinux.org/index.php/installation guide#Set the keyboard layout), make the changes persistent in [vconsole.conf(5)](https://jlk.fjfi.cvut.cz/arch/manpages/man/vconsole.conf.5):

```
/etc/vconsole.conf
KEYMAP=de-latin1
```

###### [Top](# Top)

### Network configuration

Create the [hostname](https://wiki.archlinux.org/index.php/Hostname) file:

```
/etc/hostname
myhostname
```

Add matching entries to [hosts(5)](https://jlk.fjfi.cvut.cz/arch/manpages/man/hosts.5):

```
/etc/hosts
127.0.0.1	localhost
::1		localhost
127.0.1.1	myhostname.localdomain	myhostname
```

If the system has a permanent IP address, it should be used instead of `127.0.1.1`.

Complete the [network configuration](https://wiki.archlinux.org/index.php/Network configuration) for the newly installed environment, that includes installing your preferred [network management](https://wiki.archlinux.org/index.php/Network management) software.

###### [Top](# Top)

### Initramfs

Creating a new *initramfs* is usually not required, because [mkinitcpio](https://wiki.archlinux.org/index.php/Mkinitcpio) was run on installation of the [kernel](https://wiki.archlinux.org/index.php/Kernel) package with *pacstrap*.

For [LVM](https://wiki.archlinux.org/index.php/Install Arch Linux on LVM#Adding mkinitcpio hooks), [system encryption](https://wiki.archlinux.org/index.php/Dm-crypt) or [RAID](https://wiki.archlinux.org/index.php/RAID#Configure mkinitcpio), modify [mkinitcpio.conf(5)](https://jlk.fjfi.cvut.cz/arch/manpages/man/mkinitcpio.conf.5) and recreate the initramfs image:

```
# mkinitcpio -P
```

###### [Top](# Top)

### Root password

Set the root [password](https://wiki.archlinux.org/index.php/Password):

```bash
# passwd
```

Add your user:

```bash
# useradd -m -g users -G wheel aaron
```

This add a user and gives them sudo access. Now add a password to aaron.

```bash
# passwd
```

 Check if sudo is installed

```bash
# which sudo
```

if not install sudo

Edit the sudoers.tmp

```bash
# EDITOR=nano visudo
```

Find and *uncomment*

```bash
%wheel ALL=(ALL) ALL
```

###### [Top](# Top)

### Boot loader

Choose and install a Linux-capable [boot loader](https://wiki.archlinux.org/index.php/Boot loader). If you have an Intel or AMD CPU, enable [microcode](https://wiki.archlinux.org/index.php/Microcode) updates in addition.

###### [Top](# Top)

## Reboot

Exit the chroot environment by typing `exit` or pressing `Ctrl+d`.

Optionally manually unmount all the partitions with `umount -R /mnt`: this allows noticing any "busy" partitions, and finding the cause with [fuser(1)](https://jlk.fjfi.cvut.cz/arch/manpages/man/fuser.1).

Finally, restart the machine by typing `reboot`: any partitions still mounted will be automatically unmounted by *systemd*. Remember to remove the installation medium and then login into the new system with the root account.

###### [Top](# Top)

## Post-installation

See [General recommendations](https://wiki.archlinux.org/index.php/General recommendations) for system management directions and post-installation tutorials (like setting up a graphical user interface, sound or a touchpad).

For a list of applications that may be of interest, see [List of applications](https://wiki.archlinux.org/index.php/List of applications).