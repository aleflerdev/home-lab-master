#!/bin/bash

# https://support.plex.tv/articles/200288586-installation/

# This will update your Ubuntu Server. Download Plex Media Server plexmediaserver_1.19.4.2935
# (I will try to keep it updated but you may have to get the correct version and update the bash script)
# Then it will move the .deb file to ~/Documents and install
# Then go to http://127.0.0.1:32400/web to configure (If not on a headless server)
# If on another machine use your interal IP number (ex. 192.168.0.##:32400/web)  Replace ## with your last digits

echo "Hello, World"

sudo apt update

sudo apt upgrade

# PlexMediaServer Install - Copied the link from downloads history in Google Chrome and added the wget to download to the ubuntu headless server

wget https://downloads.plex.tv/plex-media-server-new/1.19.4.2935-79e214ead/debian/plexmediaserver_1.19.4.2935-79e214ead_amd64.deb

mkdir ~/plexinstall

sudo mv plexmediaserver_1.19.4.2935-79e214ead_amd64.deb ~/plexinstall/

sudo dpkg -i plexmediaserver_1.19.4.2935-79e214ead_amd64.deb

echo "All done sucka"