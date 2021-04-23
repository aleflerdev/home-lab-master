# Create SSL Certificate
```zsh
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pemyte GV-N610SL-1G
```

    3  sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.original
    4  sudo ufw status
    5  sudo ufw enable
    6  sudo ufw allow OpenSSH
    7  sudo ufw allow 20/tcp
    8  sudo ufw allow 21/tcp
    9  sudo ufw allow 990/tcp
   10  sudo ufw allow 32400/tcp
   11  sudo ufw allow 32400
   12  sudo ufw allow 40000:50000/tcp
   13  sudo ufw status
   14  sudo adduser
   15  sudo adduser aaron
   16  sudo mkdir /home/aaron/ftp
   17  sudo chown nobody:nogroup /home/aaron/ftp
   18  sudo chmod a-w /home/aaron/ftp
   19  sudo ls -la /home/aaron/ftp
   20  sudo mkdir /home/aaron/ftp/files
   21  sudo chown aaron:aaron /home/aaron/ftp/files
   22  echo "vsftpd sample file" | sudo tee
   23  echo "vsftpd sample file" | sudo tee /home/aaron/ftp/files/sample.txt
   24  sudo nano /etc/vsftpd.conf
   25  echo "aaron" | sudo tee -a /etc/vsftpd.userlist
   26  cat /etc/vsftpd.userlist
   27  sudo systemctl restart vsftpd
   28  sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem
   29  sudo nano /etc/vsftpd.conf
   30  sudo systemctl restart vsftpd
   31  sudo systemctl status vsftpd
