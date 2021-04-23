# How to uninstall and remove Apache2 on Ubuntu or Debian
```zsh
sudo service apache2 stop
```
Then uninstall Apache2 and its dependent packages. Use purge option instead of remove with apt-get command. The former option will try to remove dependent packages, as well as any configuration files created by them. In addition, use autoremove option as well, to remove any other dependencies that were installed with Apache2, but are no longer used by any other package.
```zsh
sudo apt-get purge apache2 apache2-utils apache2.2-bin apache2-common
```
```zshsudo apt-get autoremove
```
Finally, check if there is any configuration files or manual pages belonging to Apache2, which are still not removed.
```zsh
whereis apache2
```
<!-- Terminal output -->
```zsh
apache2: /etc/apache2
```
In this example, /etc/apache2 directory still exists. Since this directory (as well as any configuration files in it) is no longer necessary, go ahead and remove it manually.
```zsh
sudo rm -rf /etc/apache2
```