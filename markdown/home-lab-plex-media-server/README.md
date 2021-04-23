#### Shell script to install the Plex Media Server on an Ubuntu Server 20.04.

#### Ubuntu Install - With WGET

- Note that ensure you have to correct version downloading. 
- ex. plexmediaserver_1.19.5.3112-b23ab3896_amd64.deb

You can either download each line seperatly and install it using terminal 

or 

create a new document (nano or whatever) and post the entire code below into the file and save-as `plex-media-server.sh`

or click here to download the *.sh file to wherever you liek.

Here is an example of how to run the plex-media-server.sh file.
```bash
./plex-media-server.sh
```
```bash
#!/bin/bash

sudo apt update && sudo apt upgrade

wget https://downloads.plex.tv/plex-media-server-new/1.19.5.3112-b23ab3896/debian/plexmediaserver_1.19.5.3112-b23ab3896_amd64.deb

sudo dpkg -i plexmediaserver_1.19.5.3112-b23ab3896_amd64.deb

echo "I've never failed at anything. Except life."
```

#### I've never failed at anything. Except life.
