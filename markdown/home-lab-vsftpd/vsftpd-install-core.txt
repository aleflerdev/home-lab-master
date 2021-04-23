sudo apt update && sudo apt upgrade
sudo apt install vsftpd

### Firewall settings using ufw
### Open firewall ports
sudo ufw allow OpenSSH
sudo ufw allow 20/tcp
sudo ufw allow 21/tcp
sudo ufw allow 990/tcp
sudo ufw allow 40000:50000/tcp
sudo ufw allow 32400/tcp

### Check ufw status
sudo ufw status
sudo ufw enable

### Add a user and create ftp directory
###the adduser myname is not necessary for me as I have already added that user for myself
###sudo adduser aaron

###sudo mkdir /home/aaron/plex-remote

###sudo chown nobody:nogroup /home/aaron/files

###sudo chown a-w /home/aaron/ftp
sudo chown a-w /home/aaron/plex-remote

###sudo mkdir /home/aaron/ftp/files

###sudo chown aaron:aaron /home/aaron/ftp/files
sudo chown aaron:aaron /home/aaron/plex-remote
sudo chmod 755 plex-remote

#777 permission on the directory means that everyone has access to read/write/execute 
#755 means read and execute access for everyone and also write access for the owner of the file. 

echo "vsftpd sample file" | sudo tee /home/aaron/plex-remote/sample.txt

### Change ownership and edit vsftpd.conf file

chmod 755 /etc/vsftpd.conf
chown aaron /etc/vsftpd.conf


## Find and replace text on vsftpd.conf file using sed

sudo touch vsftpd.userlist
sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.bak

sed -i 's/anonymous_enable=YES/anonymous_enable=NO/g' vsftpd.conf
sed -i 's/local_enable=NO/local_enable=YES/g' vsftpd.conf
sed -i 's/#write_enable=YES/write_enable=YES/g' vsftpd.conf
sed -i 's/#chroot_local_user=YES/chroot_local_user=YES/g' vsftpd.conf

### Add rules to the vsftpd.conf file

user_sub_token=aaron 
local_root=/home/aaron/plex-remote  
pasv_min_port=40000 
pasv_max_port=50000 
userlist_enable=YES 
userlist_file=/etc/vsftpd.userlist 
userlist_deny=NO

### Certificate to secure data transfer. The first step is we need to create the SSL certificate for the Ubuntu FTP serve
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem

rsa_cert_file=/etc/ssl/private/vsftpd.pem
rsa_private_key_file=/etc/ssl/private/vsftpd.pem

ssl_enable=YES
allow_anon_ssl=NO 
force_local_data_ssl=YES 
force_local_logins_ssl=YES
ssl_tlsv1=YES
ssl_sslv2=NO
ssl_sslv3=NO
require_ssl_reuse=NO
ssl_ciphers=HIGH

echo "vsftpd sample file" | sudo tee /home/aaron/plex-remote/sample.txt
echo aaron | sudo tee -a /etc/vsftpd.userlist
cat /etc/vsftpd.userlist

sudo systemctl restart vsftpd
