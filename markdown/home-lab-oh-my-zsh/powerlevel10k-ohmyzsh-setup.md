[Terminal](https://nocin.eu/category/linux/terminal/)

# [Shell] Zsh + Oh My Zsh + Powerlevel10k

 October 1, 2019 [linux](https://nocin.eu/tag/linux/), [powerlevel10k](https://nocin.eu/tag/powerlevel10k/), [terminal](https://nocin.eu/tag/terminal/), [zsh](https://nocin.eu/tag/zsh/)

**Install Zsh (Shell)**
https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH

```
sudo` `apt ``install` `zsh``chsh` `-s $(``which` `zsh)
```

Log out and login back again to use your new default shell.

```
echo` `$SHELL
```

Expected result: `/bin/zsh`

**Install Oh My Zsh** (Zsh framework with tools and themes)
https://github.com/robbyrussell/oh-my-zsh

```
sh -c ``"$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

In addition I installed the [Powerline Fonts](https://github.com/powerline/fonts):

```
apt-get ``install` `fonts-powerline
```

Restart your terminal to launch the Oh My Zsh configuration.
After the installation and configuration I usually add “neofetch | lolcat” at the end of my zsh config: ~/.zshrc

**Install Powerlevel10K** (Powerlevel10k is a theme for ZSH)
https://github.com/romkatv/powerlevel10k#oh-my-zsh

```
git clone https:``//github``.com``/romkatv/powerlevel10k``.git $ZSH_CUSTOM``/themes/powerlevel10k
```

Set `ZSH_THEME=powerlevel10k/powerlevel10k` in your `~/.zshrc`.

I also installed the patched [Meslo Nerd Font](https://github.com/romkatv/powerlevel10k#fonts) and sat it as terminal font. Else some icons will not be displayed in Powerlevel10k.
Restart your terminal and go through the configuration steps. The result will look simliar to this:

![img](https://nocin.eu/wp-content/uploads/2019/09/powerlevel10k-Screenshot-from-2019-09-30-21-38-51.png)

Path to Powerlevel10k config: ~/.p10k.zsh