# How to Properly Install and Setup KDE Plasma on Arch Linux

Last updated May 19, 2020 By [Dimitrios Savvopoulos](https://itsfoss.com/author/dimitrios/) [5 Comments](https://itsfoss.com/install-kde-arch-linux/#comments)

I believe you followed the [fantastic It’s FOSS guide on installing Arch Linux](https://itsfoss.com/install-arch-linux/). The guide ends with steps mentioning the installation procedure for [GNOME desktop](https://www.gnome.org/).

Now, not everyone is a GNOME fan and several readers requested that we show them how to configure the [KDE desktop](https://kde.org/plasma-desktop) on [Arch Linux](https://www.archlinux.org/).

And thus I created this guide to demonstrate the steps for properly installing and configuring KDE desktop (also known as KDE Plasma desktop) on Arch Linux.

## How to install and setup KDE desktop environment on Arch Linux

![Install KDE desktop on Arch Linux](https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/install-kde-arch-linux.png?ssl=1)

Please keep in mind that KDE doesn’t allow login as root directly. If you have installed Arch Linux and using it as root, you should create a new user and give it sudo rights for running commands as root.

If you just have a bare minimum installation of Arch Linux, you probably are logging into a TTY terminal. If you are using some other desktop environment, steps remain the same.

Let’s go!

### Step 1: Create a sudo user (if you have only root user)

You can use the [useradd command](https://linuxhandbook.com/useradd-command/) for creating a new user. I am creating user named dimitrios (that’s my name). You can use something that matches your name.

The option -m creates a home directory for the newly created user.



```
useradd -m dimitrios
```

You should also set a password for this user. Use this command:



```
passwd dimitrios
```

<iframe frameborder="0" src="https://tpc.googlesyndication.com/safeframe/1-0-37/html/container.html?upapi=true" id="google_ads_iframe_/15184186/itsfoss_300x250_320x50_DynamicAds_0" title="3rd party ad content" name="" scrolling="no" marginwidth="0" marginheight="0" width="728" height="90" data-is-safeframe="true" sandbox="allow-forms allow-pointer-lock allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" data-load-complete="true" style="box-sizing: border-box !important; max-width: 100%; border: 0px; vertical-align: bottom;"></iframe>

**AD**

Now that you have created the user, give it sudo access. First, install sudo and a [command line text editor](https://itsfoss.com/command-line-text-editors-linux/) like [nano](https://www.nano-editor.org/):



```
pacman -S sudo nano
```

The configuration file for sudo is /etc/sudoers. It should always be edited with the visudo command. visudo locks the sudoers file, saves edits to a temporary file, and checks that file’s grammar before copying it to /etc/sudoers.

To use nano as the visudo editor, use:



```
EDITOR=nano visudo
```

Add the following line like I do in the example, then save and exit.



```
dimitrios ALL=(ALL) ALL
```

![Adding Sudoer Arch Linux](https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/adding-sudoer-arch-linux.png?ssl=1)Adding Sudoer in Arch Linux

Save your changes and exit the editor. You now have a sudo user on Arch Linux.

### Step 2: Installing KDE Plasma desktop

To run KDE desktop, you need the following packages:

- [Xorg](https://wiki.archlinux.org/index.php/Xorg) group
- [KDE Plasma](https://kde.org/plasma-desktop) Desktop Environment
- [Wayland](https://wiki.archlinux.org/index.php/Wayland) session for KDE Plasma
- [KDE applications](https://www.archlinux.org/groups/x86_64/kde-applications/) group (consists of KDE specific applications including the Dolphin manager and other useful apps)

You can install of the above using the following command:



```
pacman -S xorg plasma plasma-wayland-session kde-applications 
```

Once installed, enable the Display Manager and Network Manager services:



```
systemctl enable sddm.service
systemctl enable NetworkManager.service
```

Almost there. Shutdown your system:



```
shutdown now
```

<iframe frameborder="0" src="https://tpc.googlesyndication.com/safeframe/1-0-37/html/container.html?upapi=true" id="google_ads_iframe_/15184186/itsfoss_300x250_320x50_DynamicAds_1" title="3rd party ad content" name="" scrolling="no" marginwidth="0" marginheight="0" width="728" height="90" data-is-safeframe="true" sandbox="allow-forms allow-pointer-lock allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" data-load-complete="true" style="box-sizing: border-box !important; max-width: 100%; border: 0px; vertical-align: bottom;"></iframe>

**AD**

Power on your system and you should see the KDE login. Do you remember the password you set up for your sudo user? Use it to login.

![Arch Plasma Desktop](https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/Arch-Plasma-desktop.jpg?fit=800%2C450&ssl=1)Arch KDE Plasma Desktop

### What next?

You may want to explore the [essential pacman commands](https://itsfoss.com/pacman-command/), to know what’s going on with the [Arch User Repository](https://itsfoss.com/aur-arch-linux/) and learn more about [AUR helpers](https://itsfoss.com/best-aur-helpers/).

I hope you found this tutorial helpful in installing KDE desktop on Arch Linux. Please let us know in the comments below, if you encountered any obstacle or difficulty during the installation.

What’s your favourite Desktop environment or Window Manager? Let us know and don’t forget to subscribe on our social media.