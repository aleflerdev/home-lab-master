#!/bin/bash

USERNAME="someusername"

# Changing to Downloads folder in order cp the vsdftpd.conf file here chanpermissions, find/replace text and add teand then cp back to /etc/ folder.

cd ~/Downloads
sudo apt update && sudo apt upgrade
sudo apt install vsftpd

# Check to see if the vsftpd.conf file is its proper location and if so copies it toDownloads

FILE=/etc/vsftpd.conf
 if test -f "$FILE"; then
    echo "$FILE exists."
    cp /etc/vsftpd.conf ~/Downloads
 fi

# This is a test to see if a program installed which could replace the abocheck for ufw.conf file

REQUIRED_PKG="ufw"
PKG_OK=$(dpkg-query -W --showformat{Status}\n' $REQUIRED_PKG|grep "install installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  echo "No $REQUIRED_PKG. Setting $REQUIRED_PKG."
  sudo apt-get --yes install $REQUIRED_PKG 
fi

# Firewall settings using ufw
# Open firewall ports

sudo ufw allow OpenSSH
sudo ufw allow 20/tcp
sudo ufw allow 21/tcp
sudo ufw allow 990/tcp
sudo ufw allow 40000:50000/tcp
sudo ufw allow 32400/tcp

# Check ufw status

sudo ufw status
sudo ufw enable

# Add a user and create ftp directory

sudo assuser $USERNAME
sudo mkdir /home/$USERNAME/ftp
sudo chown nobody:nogroup /home/$USERNAME/ftp
sudo chown a-w /home/$USERNAME/ftp
sudo ls -la /home/$USERNAME/ftp
sudo mkdir /home/$USERNAME/ftp/files
sudo chown $USERNAME:$USERNAME /ho$USERNAME/ftp/files
echo "vsftpd sample file" | sudo tee /ho$USERNAME/ftp/files/sample.txt

# Change ownership and edit vsftpd.conf file

chmod 755 vsftpd.conf
chown $USERNAME vsftpd.conf


# Find and replace text on vsftpd.conf fiusing sed
sed -i 's/anonymous_enable=Yanonymous_enable=NO/g' vsftpd.conf
sed -i 's/local_enable=NO/local_enable=Yg' vsftpd.conf
sed -i 's/#write_enable=YES/write_enable=Yg' vsftpd.conf
sed -i 's/#chroot_local_user=Ychroot_local_user=YES/g' vsftpd.conf


# Add rules to the vsftpd.conf file
echo "user_sub_token=$USER" >> vsftpd.conf
echo "local_root=/home/$USER/ftp" >> vsftconf
echo "pasv_min_port=40000" >> vsftpd.conf
echo "pasv_max_port=50000" >> vsftpd.conf
echo "userlist_enable=YES" >> vsftpd.conf
echo "userlist_file=/etc/vsftpd.userlist" vsftpd.conf
echo "userlist_deny=NO" >> vsftpd.conf


# Making FTP Secure

# By default, FTP doesn’t encrypt data, we will be using
# SSL/TLS
# Certificate to secure data transfer. Tfirst step is we need to create the Scertificate for the Ubuntu FTP serve
sudo openssl req -x509 -nodes -days 3-newkey rsa:2048 -keyout /etc/ssl/privavsftpd.pem -out /etc/ssl/private/vsftpd.pem


# This points the configuration file to tcertificate that created
echo "rsa_cert_file=/etc/ssl/private/vsftpem" >> vsftpd.conf
echo "rsa_private_key_file=/etc/ssl/privavsftpd.pem" >> vsftpd.conf


# Adding rules to the vsftpd.conf file
echo "ssl_enable=YES" >> vsftpd.conf
echo "allow_anon_ssl=NO" >> vsftpd.conf
echo "force_local_data_ssl=YES" >> vsftconf
echo "force_local_logins_ssl=YES" >> vsftconf
echo "ssl_tlsv1=YES" >> vsftpd.conf
echo "ssl_sslv2=NO" >> vsftpd.conf
echo "ssl_sslv3=NO" >> vsftpd.conf
echo "require_ssl_reuse=NO" >> vsftpd.conf
echo "ssl_ciphers=HIGH" >> vsftpd.conf
echo "$USERNAME" | sudo tee -a /etc/vsftuserlist
cat /etc/vsftpd.userlist


# Here I return the vsftpd.conf edited fiback to /etc/
sudo cp -r ~/Downloads/vsftpd.conf /etc/


# Restart vsftpd and cross my fingers
sudo systemctl restart vsftpd

echo "I've never failed at anything. Excelife