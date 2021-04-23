## About

A theme engine for Powershell in ConEmu and Windows Terminal inspired by the work done by Chris Benti on [PS-Config](https://github.com/chrisbenti/PS-Config) and [Oh-My-ZSH](https://github.com/robbyrussell/oh-my-zsh) on OSX and Linux (hence the name).

More information about why I made this can be found on my [blog](https://blog.itdepends.be/shell-shock/).

[![Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/indications.png)](https://github.com/JanDeDobbeleer/oh-my-posh/blob/master/img/indications.png)

Features:

- Easy installation
- Awesome prompt themes for PowerShell in ConEmu
- Git status indications (powered by posh-git)
- Failed command indication
- Admin indication
- Current session indications (admin, failed command, user)
- Configurable
- Easily create your own theme
- Separate settings for oh-my-posh and posh-git
- Does not mess with the default Powershell console

## Prerequisites

You should use ConEmu or Windows Terminal to have a brilliant terminal experience on Windows.

You can install ConEmu using [Chocolatey](https://chocolatey.org/):

```
choco install ConEmu
```

You can also install it using [Scoop](https://scoop.sh/) via the [extras bucket](https://github.com/lukesampson/scoop/wiki/Buckets):

```
$ scoop search conemu
'extras' bucket:
  conemu (18.xx.xx)
$ scoop install conemu
```

Windows Terminal can be acquired from the Microsoft Store, the [Windows Terminal repo](https://github.com/microsoft/terminal), or via [Chocolatey](https://chocolatey.org/):

```powershell
choco install microsoft-windows-terminal
```

The fonts I use are Powerline fonts, there is a great [repository](https://github.com/ryanoasis/nerd-fonts) containing them. I use `Meslo LG M Regular for Powerline Nerd Font` in my ConEmu setup together with custom colors. You can find my theme [here](https://gist.github.com/JanDeDobbeleer/71c9f1361a562f337b855b75d7bbfd28).

In case you notice weird glyphs after installing a font of choice, make sure the glyphs are available (maybe they have a different location in the font, if so, adjust the correct `$ThemeSettings` icon). If it turns out the character you want is not supported, select a different font.

## Installation

You need to use the [PowerShell Gallery](https://www.powershellgallery.com/packages/oh-my-posh/) to install oh-my-posh.

Install posh-git and oh-my-posh:

```
Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser
```

Enable the prompt:

```
# Start the default settings
Set-Prompt
# Alternatively set the desired theme:
Set-Theme Agnoster
```

In case you're running this on PS Core, make sure to also install version 2.0.0-beta1 of `PSReadLine`

```
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
```

To enable the engine edit your PowerShell profile:

```
if (!(Test-Path -Path $PROFILE )) { New-Item -Type File -Path $PROFILE -Force }
notepad $PROFILE
```

Append the following lines to your PowerShell profile:

```
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Paradox
```

The last command sets the theme for the console. Check the available themes list below.

## Configuration

List the current configuration:

```
$ThemeSettings
```

[![Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/themesettings.png)](https://github.com/JanDeDobbeleer/oh-my-posh/blob/master/img/themesettings.png)

You can tweak the settings by manipulating `$ThemeSettings`. This example allows you to tweak the branch symbol using a unicode character:

```
$ThemeSettings.GitSymbols.BranchSymbol = [char]::ConvertFromUtf32(0xE0A0)
```

Also do not forget the Posh-Git settings itself (enable the stash indication for example):

```
$GitPromptSettings
```

Hide your `username@domain` when not in a virtual machine for the Agnoster, Fish, Honukai, Paradox and Sorin themes:

```
$DefaultUser = 'yourUsernameHere'
```

## Helper functions

`Set-Theme`: set a theme from the Themes directory. If no match is found, it will not be changed. Autocomplete is available to list and complete available themes.

```
Set-Theme paradox
```

`Show-ThemeColors`: display the colors used by the theme

[![Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/themecolors.png)](https://github.com/JanDeDobbeleer/oh-my-posh/blob/master/img/themecolors.png)

`Show-Colors`: display colors configured in ConEmu

[![Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/showcolors.png)](https://github.com/JanDeDobbeleer/oh-my-posh/blob/master/img/showcolors.png)

## Themes

### Agnoster

[![Agnoster Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/agnoster.png)](https://github.com/JanDeDobbeleer/oh-my-posh/blob/master/img/agnoster.png)

### Paradox

[![Paradox Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/paradox.png)](https://github.com/JanDeDobbeleer/oh-my-posh/blob/master/img/paradox.png)

### Sorin

[![Sorin Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/sorin.png)](https://github.com/JanDeDobbeleer/oh-my-posh/blob/master/img/sorin.png)

### Darkblood

[![Darkblood Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/darkblood.png)](https://github.com/JanDeDobbeleer/oh-my-posh/blob/master/img/darkblood.png)

### Avit

[![Avit Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/avit.png)](https://github.com/JanDeDobbeleer/oh-my-posh/blob/master/img/avit.png)

### Honukai

[![Honukai Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/honukai.png)](https://github.com/JanDeDobbeleer/oh-my-posh/blob/master/img/honukai.png)

### Fish

[![Fish Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/fish.png)](https://github.com/JanDeDobbeleer/oh-my-posh/blob/master/img/fish.png)

### Robbyrussell

[![Robbyrussell Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/robbyrussel.png)](https://github.com/JanDeDobbeleer/oh-my-posh/blob/master/img/robbyrussel.png)

### Pararussel

[![Pararussel Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/pararussel.png)](https://github.com/JanDeDobbeleer/oh-my-posh/blob/master/img/pararussel.png)

### Material

[![Material Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/material.png)](https://github.com/JanDeDobbeleer/oh-my-posh/blob/master/img/material.png) [![Material Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/material2.png)](https://github.com/JanDeDobbeleer/oh-my-posh/blob/master/img/material2.png)

### Star

[![Star Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/star.png)](https://github.com/JanDeDobbeleer/oh-my-posh/blob/master/img/star.png)

### Zash

[![Star Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/zash.png)](https://github.com/JanDeDobbeleer/oh-my-posh/blob/master/img/zash.png)

### Lambda

[![Lambda Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/lambda.png)](https://github.com/JanDeDobbeleer/oh-my-posh/blob/master/img/lambda.png)