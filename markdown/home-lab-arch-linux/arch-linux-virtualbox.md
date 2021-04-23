# How to install Arch Linux on VirtualBox

###### top

On this page

1. [Arch Linux Repositories](# Arch-Linux-Repositories)
2. Install Arch Linux on Virtual Box
   1. [Download Arch Linux](# Download-Arch-Linux)
   2. [Initializing Installation with Oracle VM VirtualBox Manager](# Initializing-Installation-with-Oracle-VM-VirtualBox-Manager)
   3. [Partition the hard disk](# Partition-the-hard-disk)
   4. [Bootstrap Arch Linux](# Bootstrap-Arch-Linux)
   5. [Setup hostname and networking](# Setup-hostname-and-networking)
   6. [Install the Bootloader](# Install-the-Bootloader)
   7. [Boot into the installed ArchLinux operating system](# Boot-into-the-installed-ArchLinux-operating-system)

Arch Linux is a Linux-based operating system that is designed for i689 and x86-64 computers. Its unique package manager is responsible for providing updates to the latest software applications using “pacman” with complete tracking. Pacman is the package manager that is used to install, update, and remove the software packages. It is designed entirely for free and open-source software, along with the support from the Linux community.

Arch Linux is also popular for having a comprehensive documentation in form of the community wiki known as ArchWiki. This Linux operating system is based on binary packages that are targeted for i832, 64-bit, and 32-bit systems and optimized for the best performance on modern hardware systems.

You can install Arch Linux directly to your home computer by following this guide but you can also install it on a virtual machine on your Windows computer by using VirtualBox.

## Arch Linux Repositories

[top](# top)

To install Arch Linux on Virtual Box, you must know the basic repositories of this Linux-based operating system. A repository is a storage location from where the software packages are retrieved during the installation process. There are multiple repositories available for Arch Linux, which are accessible via pacman and maintained by package maintainers. Here is a list of some of the basic repositories used to install Arch Linux on Virtual Box:



- The **core** repository contains all the packages that are needed to setup the base system like booting Arch Linux and building packages.
- The **extra** repository contains extra packages that do not fit in the core involving desktop environment.
- The **community** repository has packages that are adopted by trusted Linux community users, and most of them will transfer to the core or extra repository.
- The **Multilib** repository contains 32-bit software and libraries for 32-bit application installation on 64-bit system.
- The **testing** repository contains packages that are destined for core or extra repositories.
- The **community-testing** repository is for the Linux community.
- The **multilib testing** repository is similar to the testing repository, but for multilib candidates.
- The **gnome-unstable** repository has the latest GNOME desktop environment.
- The **kde-unstable** repository contains the latest KDE software before they are been released.



## Install Arch Linux on Virtual Box

[top](# top)

### Download Arch Linux

To install Arch Linux on Virtual Box, you must have the latest Arch Linux version that you can download from their [official website](https://www.archlinux.org/). You can pick either the direct download option or torrent download, which is on a secure server. Before the installation, make sure you have 20 MB of free disk space and 1 GB of RAM in your system.

[![Download Arch Linux](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/1212.png?ezimgfmt=rs:532x246/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/1212.png)



### Initializing Installation with Oracle VM VirtualBox Manager

[top](# top)

Open the Oracle VM VirtualBox manager, click on new, and type in the name of the new operating system you want to create; in this case, it is Arch Linux. The system will automatically pick up the type and version of the Arch Linux, based on your system’s configuration. Click on *next*.

[![Open VirtualBox](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/12121.png?ezimgfmt=rs:532x420/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/12121.png)

Allocate the desired  RAM size to your new operating system, which is ideally 1024 MB. Click on *next* and then click on *create*, to create a virtual disk now.

[![Set RAM size](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/12122.png?ezimgfmt=rs:532x423/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/12122.png)

On the next page, you will be asked to select the type of hard disk file you want for your new operating system. Select VirtualBox Disk Image usually.

[![Select disk file type](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/12123.png?ezimgfmt=rs:532x417/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/12123.png)

Choose dynamically allocated and click *next*.

[![Allocate disk space dynamically](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/12124.png?ezimgfmt=rs:532x413/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/12124.png)

Allocate 20 GB hard disk file location and size.

[![Choose a hard disk size of 20GB](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/12125.png?ezimgfmt=rs:532x427/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/12125.png)



Now you can see that your Arch Linux operating system is created. Now you can click *start*.

[![Start the Virtual Machine](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/12126.png?ezimgfmt=rs:532x422/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/12126.png)



Click on 'browser' and select the startup disk, which you downloaded from the Arch Linux official website.

[![Choose Arch Linux Disk image](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/12127.png?ezimgfmt=rs:532x429/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/12127.png)



[![Browse for disk image file](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/12128.png?ezimgfmt=rs:532x390/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/12128.png)



Click on *start* and then open the full-screen view.

[![Open the full-screen view](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/12129.png?ezimgfmt=rs:532x422/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/12129.png)



[![Start the Arch Linux VM](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121210.png?ezimgfmt=rs:532x425/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121210.png)



## **Booting to Install Arch Linux on Virtual Box**

[top](# top)



You will see the first opening page of Arch Linux. Click on “Boot Arch Linux (x86_64), which is for 64-bit or click on “Boot Arch Linux (i686)”, which is for 32-bit.

[![Choose to boot Arch Linux](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121211.png?ezimgfmt=rs:532x414/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121211.png)



As soon as you click on the first option, the system will start booting. While it completes the temporary boot, we are basically moving into the live version and are logged in as root user.

[![Booting into Arch Linux live version](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121212.png?ezimgfmt=rs:532x311/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121212.png)



Check the Internet connection by typing in the following command.



```
ping google.com 
```

The word ping stands for packet internet gopher. You will soon see the response that means Arch Linux has activated the Internet connection. This is essential to perform certain installation steps.

[![Test internet connectivity with ping](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121213.png?ezimgfmt=rs:532x298/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121213.png)

Clear the command by typing



```
clear
```

Before we start the installation, you should partition your drive. Type ***# fdisk – l\*** and you will see the current system’s disk partition. Focus on the 20 GB hard drives that you allocated to Arch in the beginning.



```
fsdisk -l
```

[![Partition the harddisk](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121214.png?ezimgfmt=rs:532x296/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121214.png)

### Partition the hard disk

[top](# top)

We are going to partition this 20 GB space into three partitions. The first one is the primary root partition that will be of 10 GB. The second will be the swap partition, which will be twice the initial RAM allocation that will be 2048 MB. The third will be the logical partition that will be 8 GB allocated.

[![Create 3 disk partitions](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121215.png?ezimgfmt=rs:532x296/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121215.png)

Type the command:



```
cfdisk
```

 You will see gpt, dos, sgi, and sun. Select the *dos* option and press *enter*.

[![Create a partition of type DOS](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121216.png?ezimgfmt=rs:532x307/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121216.png)

Here you will see the main disk space, which is 20 GB. To change this, press <enter> on the free space and type **10G**.

[![Choose 10GB partition size](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121217.png?ezimgfmt=rs:532x321/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121217.png)

Press *enter* and then click on the “**primary**” partition.

[![img](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121218.png?ezimgfmt=rs:532x346/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121218.png)

Now select the “**bootable**” type by pressing enter on bootable.

[![Make partition bootable.](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121219.png?ezimgfmt=rs:532x338/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121219.png)

Go to *write* and press enter, to write partition to disk.

[![Write partition to disk](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121220.png?ezimgfmt=rs:532x346/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121220.png)

Then type *yes* to make the changes, successfully.

[![Confirm changes](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121221.png?ezimgfmt=rs:532x354/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121221.png)

Now the 10 GB partition is created. Click on *free space* and then enter the partition size of 2048 M.

[![Create the 2GB swap partition](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121222.png?ezimgfmt=rs:532x338/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121222.png)

Now follow the same steps to create the logical partition. Then press enter on *quit* and clear the command by typing



```
clear
```

[![quit cfdisk](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121223.png?ezimgfmt=rs:532x357/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121223.png)

Format the newly partitioned disk by typing:



```
mkfs.ext4 /dev/sda1
```

Here *sda1* is the partition name. Repeat this for the second drive by typing:



```
mkfs.ext4 /dev/sda3 
```

and for the swap partition,



```
mkswap /dev/sda2
```

[![Format the swap partition with mkswap](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121224.png?ezimgfmt=rs:532x312/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121224.png)



Activate the swap by typing:



```
swapon /dev/sda2 
```

and clear the command by typing:



```
clear
```

[![Enable swap](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121225.png?ezimgfmt=rs:532x327/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121225.png)



Mount the primary partition to start the installation part by typing:



```
mount /dev/sda1 /mnt
mkdir /mnt/home
mount /dev/sda3 /mnt/home
```

[![Mount the partitions](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121226.png?ezimgfmt=rs:532x280/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121226.png)



### Bootstrap Arch Linux

[top](# top)

Bootstrap the system by typing:



```bash
pacstrap /mnt base base-devel linux linux-firmware nano dhcpcd
```

You can see that it is synchronizing the data packages.

[![Bootstrap Arch Linux](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121227.png?ezimgfmt=rs:532x304/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121227.png)

The installation will start and will take a few minutes.

[![Arch Linux installation has been started](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121228.png?ezimgfmt=rs:532x346/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121228.png)



After the base installation create the fstab file by tying:



```
genfstab /mnt>> /mnt/etc/fstab 
```

[![Generating /etc/fstab](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121229.png?ezimgfmt=rs:532x284/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121229.png)



Configure locale, time and root password.

Change the system root to the Arch Linux installation directory by typing:



```bash
arch-chroot /mnt
```

 

Now to configure the language settings:



```
nano /etc/locale.gen
```

pressing *control + x,* press *y*, and press *enter*.

[![select language](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121231.png?ezimgfmt=rs:532x309/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121231.png)

Now activate it by typing:



```
locale-gen
```

and press *enter*.

[![Generate the locales in Arch Linux](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121232.png?ezimgfmt=rs:532x275/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121232.png)



Create the  /etc/locale.conf file by typing:



```
nano /etc/locale.conf 
```



then press *enter*. Now you can add your language to the system by adding this line to the file:



```
LANG=en_US.UTF-8
```



 Then press *control + x* and press *y*, and press *enter*.

[![Set default language](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/1.png?ezimgfmt=rs:532x216/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/1.png)



Synchronize the zone information by typing:



```
ls /usr/share/zoneinfo
```

and you will find a list of all the zones of the world.

[![Set System language default](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/11.png?ezimgfmt=rs:532x293/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/11.png)



To select your zone, type:



```
ln –s /usr/share/zoneinfo/Asia/Kolkata /etc/localtime 
```

or you can select any name from the below list.

[![img](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/12.png?ezimgfmt=rs:532x201/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/12.png)



Set the time standard using the command.



```
hwclock --systohc --utc
```



And the hardware clock is synchronized.

[![Set time](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/13.png?ezimgfmt=rs:532x258/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/13.png)



Set the root user password by typing:

```bash
passwd 
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

And press *enter*. Then type your password and press enter.

[![Set the root password](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/14.png?ezimgfmt=rs:532x219/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/14.png)



### Setup hostname and networking

[top](# top)

Enter the host name of the network by typing:



```
nano /etc/hostname
```



and press *enter*. Now type any name and then press *control + x* and press *y*, and press *enter*.

[![Set the hostname](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/15.png?ezimgfmt=rs:532x325/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/15.png)



Enable the dhcpcd by typing:

```
systemctl enable dhcpcd
```

and it will be started at next boot time to fetch an IP address automatically.
  ](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/16.png)

[![Enable dhcpd](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/16.png?ezimgfmt=rs:532x217/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/16.png)

### Install the Bootloader

[top](# top)

The final step, initiate the grub installation. Type:



```
pacman –S grub os-prober
```



then press *y* and the download part will begin.

[![Configure grub](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/17.png?ezimgfmt=rs:532x261/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/17.png)

Install the grub boot loader to the hard disk by typing:



```bash
grub-install /dev/sda
```

and configure it:



```
grub-mkconfig –o /boot/grub/grub.cfg
```

[![Install and configure grub boot loader](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/18.png?ezimgfmt=rs:532x253/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/18.png)

Finally, exit from chroot and then reboot the system by typing:



```
exit
reboot
```



and press *enter.*

[![Reboot the system](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/19.png?ezimgfmt=rs:532x249/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/19.png)

### Boot-into the installed ArchLinux operating system

[top](# top)

Choose “Boot Existing OS” to boot Arch Linux on Virtual Box.

[![Boot Arch Linux](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/110.png?ezimgfmt=rs:532x376/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/110.png)



Login with your root name and password, and you will enter your new Arch Linux operating system.

[![Arch Linux installed successfully](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/111.png?ezimgfmt=rs:532x246/rscb1/ng:webp/ngcb1)](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/111.png)