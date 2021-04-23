# Bash Script question on Stack Exchange

Hello. I hope someone can help. I am not a professional and do not work in the industry. My last two jobs were Naval Officer / Truck Driver. I love screwing around with tech.

I am feeling confident in a Linux environment now and tried to write my first long bash script. I actually got it to work, with a lot of help from the posts in this community. However, I made a permission mistake somewhere or an error in what directories to include when setting up **VSFTP** completely using a script.

I hope someone can see my mistake as I would like to get this perfect and continue learning. I will attach the full script below.

```bash
#!/bin/bash

USERNAME="someusername"

# Changing to Downloads folder in order to cp the vsdftpd.conf file here change permissions, find/replace text and add text and then cp back to /etc/ folder.

cd ~/Downloads
sudo apt update && sudo apt upgrade
sudo apt install vsftpd

# Check to see if the vsftpd.conf file is in its proper location and if so copies it to ~/Downloads

FILE=/etc/vsftpd.conf
 if test -f "$FILE"; then
    echo "$FILE exists."
    cp /etc/vsftpd.conf ~/Downloads
 fi

# This is a test to see if a program is installed which could replace the above check for ufw.conf file

REQUIRED_PKG="ufw"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
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
sudo chown $USERNAME:$USERNAME /home/$USERNAME/ftp/files
echo "vsftpd sample file" | sudo tee /home/$USERNAME/ftp/files/sample.txt

# Change ownership and edit vsftpd.conf file

chmod 755 vsftpd.conf
chown $USERNAME vsftpd.conf


# Find and replace text on vsftpd.conf file using sed
sed -i 's/anonymous_enable=YES/anonymous_enable=NO/g' vsftpd.conf
sed -i 's/local_enable=NO/local_enable=YES/g' vsftpd.conf
sed -i 's/#write_enable=YES/write_enable=YES/g' vsftpd.conf
sed -i 's/#chroot_local_user=YES/chroot_local_user=YES/g' vsftpd.conf


# Add rules to the vsftpd.conf file
echo "user_sub_token=$USER" >> vsftpd.conf
echo "local_root=/home/$USER/ftp" >> vsftpd.conf
echo "pasv_min_port=40000" >> vsftpd.conf
echo "pasv_max_port=50000" >> vsftpd.conf
echo "userlist_enable=YES" >> vsftpd.conf
echo "userlist_file=/etc/vsftpd.userlist" >> vsftpd.conf
echo "userlist_deny=NO" >> vsftpd.conf


# Making FTP Secure

# By default, FTP doesn’t encrypt data, so we will be using
# SSL/TLS
# Certificate to secure data transfer. The first step is we need to create the SSL certificate for the Ubuntu FTP serve
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem


# This points the configuration file to the certificate that created
echo "rsa_cert_file=/etc/ssl/private/vsftpd.pem" >> vsftpd.conf
echo "rsa_private_key_file=/etc/ssl/private/vsftpd.pem" >> vsftpd.conf


# Adding rules to the vsftpd.conf file
echo "ssl_enable=YES" >> vsftpd.conf
echo "allow_anon_ssl=NO" >> vsftpd.conf
echo "force_local_data_ssl=YES" >> vsftpd.conf
echo "force_local_logins_ssl=YES" >> vsftpd.conf
echo "ssl_tlsv1=YES" >> vsftpd.conf
echo "ssl_sslv2=NO" >> vsftpd.conf
echo "ssl_sslv3=NO" >> vsftpd.conf
echo "require_ssl_reuse=NO" >> vsftpd.conf
echo "ssl_ciphers=HIGH" >> vsftpd.conf
echo "$USERNAME" | sudo tee -a /etc/vsftpd.userlist
cat /etc/vsftpd.userlist


# Here I return the vsftpd.conf edited file back to /etc/
sudo cp -r ~/Downloads/vsftpd.conf /etc/


# Restart vsftpd and cross my fingers
sudo systemctl restart vsftpd

echo "I've never failed at anything. Except life."
```

## That's it.
So it did work for me and I could connect via FileZilla. 

**My problem is that I am able to access all files and folders including the root directory and all sub-directories.**

I am pretty sure that this is really not secure.

OK I know that's a lot of reading but I hope someone can point out my mistakes.

Also, could someone point me in a good training tool or book to learn more about Linux, the shell and bash scripting. (Preferrably not a b.s. site trying to sell me Udemy courses or get my email)

Thank you

Aaron