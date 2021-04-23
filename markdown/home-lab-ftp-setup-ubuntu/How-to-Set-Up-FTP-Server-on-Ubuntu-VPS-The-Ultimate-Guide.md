# How to Set Up FTP Server on Ubuntu VPS: The Ultimate Guide

In this article, you are going to learn how to set up an FTP server on an Ubuntu VPS. We’ll be using a [vsftpd](https://security.appspot.com/vsftpd.html) server, which is widely regarded as the fastest and most secure FTP server for UNIX-like systems.

## What is FTP?

FTP, or [File Transfer Protocol](https://www.hostinger.com/tutorials/what-is-ftp), is a means to share files between computers over an internet connection using the TCP/IP protocol. It also makes use of a client-server  framework and SSL/TLS security to ensure secure and reliable data  transfer.

This is somewhat similar to [HTTP](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol) (HypertText Transfer Protocol) or [SMTP](https://en.wikipedia.org/wiki/Simple_Mail_Transfer_Protocol) (Simple Mail Transfer Protocol). The difference is that FTP is  responsible for transporting files through the internet while HTTP and  SMTP handle the transfer of web pages and emails, respectively.

Before we begin, keep in mind that we will guide you through configuring an FTP server on [Ubuntu](https://ubuntu.com/) 18.04. Therefore, you need to make sure your VPS is running on that particular OS.

## How to Set Up an FTP Server on Ubuntu

This tutorial requires you to know [how to connect to a server through SSH](https://www.hostinger.com/tutorials/how-to-connect-to-your-account-using-putty). If you own [Hostinger’s VPS](https://www.hostinger.com/vps-hosting), the login details are available in the **Server** tab of the hPanel.

### Step 1 – Installing vsftpd

1. First of all, we’ll have to get our package updates before we proceed with the vsftpd installation. To begin, run the following command:

   ```
sudo apt-get update
   ```

   Wait for all the processes to complete, and you will see a confirmation as soon as the update finishes.
   
2. Once it’s done, install the 

   vsftpd

    daemon using the command below:

   ```
   sudo apt-get install vsftpd
   ```

   You will be prompted with a confirmation message, which will require you to type **Y** and hit **Enter** to continue with the installation.

3. After the installation is completed, you should back up the original file so you can start with a blank configuration file:

   ```bash
   sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.original
   ```

   Now we are ready to configure the firewall.

### Step 2 – Allowing FTP Traffic from the Firewall

1. To allow the Ubuntu FTP server to communicate via the internet, it needs  to make its way through the firewall. But first, let’s just see whether  the firewall is already enabled on your machine or not. Simply run this  command to verify the status:

   ```bash
   sudo ufw status
   ```

   If you see the following message:

   ```bash
   ufw: command not found
   ```

   It means that the firewall is not installed. You can install and enable it by typing:

   ```bash
   sudo apt-get install ufw
   sudo ufw enable
   ```

2. If it’s already active, you still need to  make sure FTP traffic is allowed. To do that, execute the following  commands one by one:

   ```bash
   sudo ufw allow OpenSSH
   sudo ufw allow 20/tcp
   sudo ufw allow 21/tcp
   sudo ufw allow 990/tcp
   sudo ufw allow 40000:50000/tcp
   ```

   This series of commands will open up several ports:

   - **OpenSSH** is required if you still wish to access your server via SSH. Sometimes, this option is enabled by default.
   - ports **20** and **21** for the FTP traffic.
   - ports **40000:50000** will be reserved for the range of passive ports that will eventually be set in the configuration file.
   - port **990** will be used when TLS is enabled.

3. Now let’s look at the status again:

   ```
   sudo ufw status
   ```

   The output should look something like this:

   ```
   Status: active
   To                         Action From
   --                              ------ ----
   OpenSSH                    ALLOW Anywhere
   990/tcp                    ALLOW Anywhere
   20/tcp                     ALLOW Anywhere
   21/tcp                     ALLOW Anywhere
   40000:50000/tcp            ALLOW Anywhere
   OpenSSH (v6)               ALLOW Anywhere (v6)
   20/tcp (v6)                ALLOW Anywhere (v6)
   21/tcp (v6)                ALLOW Anywhere (v6)
   990/tcp (v6)               ALLOW Anywhere (v6)
   40000:50000/tcp (v6)       ALLOW Anywhere (v6)
   ```

### Step 3 – Creating the User Directory

1. Once the firewall is set up, we must create the user who is going to use the FTP access. This is how to do it:

   ```
   sudo adduser hostinger
   ```

   Remember to change the username according to your own preference.

2. Then, enter a password for the user and fill in all the required details.
    Ideally, FTP should be restricted to one specific directory for security purposes. That is why **vsftpd** uses **chroot jails**, which limits a local user to their home directory by default.
    However, it is possible that because of **vsftpd** security, a user might not be able to write to that directory. To fix  this, we don’t have to remove write privileges from the home folder.  Instead, we will make an ftp directory which acts as **chroot**. It contains a writable directory that will be responsible for holding the required files.

3. Use the following command to create the FTP folder:

   ```bash
   sudo mkdir /home/hostinger/ftp
   ```

   Then, set the ownership using:

   ```bash
   sudo chown nobody:nogroup /home/hostinger/ftp
   ```

   Finally, remove the write permission:

   ```
   sudo chmod a-w /home/hostinger/ftp
   ```

   Now, use the following command to verify the permissions:

   ```bash
   sudo ls -la /home/hostinger/ftp
   ```

   The output should look something like:

   ```
   total 8
   dr-xr-xr-x 2 nobody nogroup 4096 Oct 8 11:32 .
   drwxr-xr-x 3 hostinger   hostinger 4096 Oct 8 11:32 ..
   ```

4. Next, we will create the file-holding directory and assign ownership:

   ```bash
   sudo mkdir /home/hostinger/ftp/files
   sudo chown hostinger:hostinger /home/hostinger/ftp/files
   ```

   Finally, add a test file to the directory which will be used when we test everything later on:

   ```bash
   echo "vsftpd sample file" | sudo tee /home/hostinger/ftp/files/sample.txt
   ```

### Step 4 – Configuring vsftpd

The next step is to configure vsftpd and our FTP access. In this example,  we will allow a single user to connect using a local shell account. The  two key configurations required for this are already set in the  configuration (**vsftpd.conf**) file.

1. To begin, 

   use the nano command

    to open 

   vsftpd

    configuration file.

   ```bash
   sudo nano /etc/vsftpd.conf
   ```

   Verify that the content has similar settings to this:

   ```bash
   . . .
   # Allow anonymous FTP? (Disabled by default).
   anonymous_enable=NO
   #
   # Uncomment this to allow local users to log in.
   local_enable=YES
   . . .
   ```

   In the same file, we will remove **#** (uncomment) and make sure we enable the **write_enable**.

   ```
   . . .
   write_enable=YES
   . . .
   ```

2. You also need to uncomment 

   chroot

    to ensure that the FTP user only accesses files within the allowed directory. Change the 

   NO

    value to 

   YES

   , as well. Keep in mind that there are two lines like this, and you have to uncomment both of them.

   ```
   . . .
   chroot_local_user=YES
   . . .
   ```

3. There are a few new values that you should also add to the bottom of the file. The first one is 

   user_sub_token

    in the 

   local_root directory path

   . It will allow the configuration to work with the current user or any other users that are subsequently added:

   ```bash
   user_sub_token=$USER
   
   local_root=/home/$USER/ftp
   ```

4. To ensure that a substantial amount of connections are available, we will limit the number of ports the configuration file:

   ```
   pasv_min_port=40000
   pasv_max_port=50000
   ```

5. In this tutorial, we intend to allow  access on a case by case basis. Therefore, we’ll set the configuration  to grant access only to users that you have explicitly added to the  list:

   ```
   userlist_enable=YES
   userlist_file=/etc/vsftpd.userlist
   userlist_deny=NO
   ```

   When you set **userlist_deny flag** to **NO**, only specified users will be allowed access. Once done, click **CTRL+X** followed by **Y** to save it, then **Enter** to confirm the file changes.

6. Lastly, we will create a user list and add a user to the file:

   ```bash
   echo "hostinger" | sudo tee -a /etc/vsftpd.userlist
   ```

   Verify that the user is indeed active by running the following command:

   ```bash
   cat /etc/vsftpd.userlist
   ```

   The output should be “hostinger” as shown in this screenshot:
    ![Verifying user on userlist on a VPS](https://www.hostinger.com/tutorials/wp-content/uploads/sites/2/2018/01/user-list-vsftpd.png)

7. Restart the daemon using the following command to load the configuration changes:

   ```bash
   sudo systemctl restart vsftpd
   ```

### Step 5 – Making FTP Secure

1. By default, FTP doesn’t encrypt data, so we will be using 

   SSL/TLS 

   certificate to secure data transfer. The first step is we need to create the SSL certificate for the Ubuntu FTP server.

   ```bash
   sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem
   ```

   The **–days** flag makes the certificate valid for a year and we have included a **2048-bit** private **RSA** key in the same command.

2. Once prompted, enter the corresponding personal details in the field provided.

3. After you finish creating the certificate, open the configuration file again:

   ```bash
   sudo nano /etc/vsftpd.conf
   ```

   The end of the file should contain two lines that start with **rsa**.

   ```bash
   # rsa_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem
   # rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
   ```

   Now, we will point the configuration file to the certificate that we just  created. Add the following directories right below the previous lines:

   ```
   rsa_cert_file=/etc/ssl/private/vsftpd.pem
   rsa_private_key_file=/etc/ssl/private/vsftpd.pem
   ```

4. Next, we will enable SSL and ensure that only clients who have an active SSL can contact us. Simply enter this line:

   ```bash
   ssl_enable=YES
   ```

   Then, add the following lines to ban any anonymous connections over SSL:

   ```
   allow_anon_ssl=NO
   force_local_data_ssl=YES
   force_local_logins_ssl=YES
   ```

   Configure the server to use TLS using:

   ```
   ssl_tlsv1=YES
   ssl_sslv2=NO
   ssl_sslv3=NO
   ```

5. Now we will change two more options. Firstly, disable 

   SSL reuse

    to prevent FTP clients from breaking down. Secondly, we will use high  encryption cipher suites, which make sure that key lengths are either  equal to or greater than 128 bits.

   ```
   require_ssl_reuse=NO
   ssl_ciphers=HIGH
   ```

   Save the file again by pressing **CTRL+X** followed by **Y**, then hit **Enter**.

6. Let’s restart 

   vsftpd

    once again to apply the new configurations:

   ```
   sudo systemctl restart vsftpd
   ```

Great work! You have now configured the FTP server on your Ubuntu VPS to work with SSL/TLS protocol.

### Step 6 – Testing Connection with FileZilla

Nowadays, most FTP clients support TLS encryption configurations. It’s a great  way to test whether your Ubuntu FTP server is working properly. To test  out the connection, we will be using a [FileZilla FTP Client](https://www.hostinger.com/tutorials/ftp/filezilla-ftp-configuration).

1. To start, launch **FileZilla** and click on the **Site Manager** icon. Then, click the **New Site** button in the prompted window to enter the Ubuntu FTP server details.
    ![FileZilla quick connect window](https://www.hostinger.com/tutorials/wp-content/uploads/sites/2/2018/01/filezilla-1024x779.png)
2. Fill in all the required columns with your newly created Ubuntu FTP server  information. Since we configured it to use TLS, we may also choose the **Use explicit FTP over TLS** option. The final configuration should look like this:
    ![FileZilla connection settings](https://www.hostinger.com/tutorials/wp-content/uploads/sites/2/2018/01/connecting-ftp-filezilla.png)
3. Once ready, click **Connect,** and a screen asking to enter the FTP user’s password will appear. After that, hit **OK**.
4. Finally, you will need to verify the SSL certificate of your FTP server on  Ubuntu VPS. After confirming, the root directory with the test file  should now appear on your screen.
    ![Test file on Ubuntu FileZilla client](https://www.hostinger.com/tutorials/wp-content/uploads/sites/2/2018/01/ubuntu-ftp-server-connection-1024x781.png)

That’s all! Now, you can perform various files transfers from your computer to the Ubuntu FTP server and vice versa.

## Conclusion

Having an Ubuntu FTP server makes it easy for you to share files between your  Ubuntu VPS/server and computer. It is a secure and reliable method of  data transfer, thanks to SSL/TLS security and the TCP/IP protocol.

In this tutorial, you have learned how to set up an FTP server on Ubuntu 18.04 using [vsftpd](https://security.appspot.com/vsftpd.html). There are five steps that you should follow. Let’s take a look at them once again.

1. Install **vsftpd** on your Ubuntu server and back up the original configuration file.
2. Allow FTP connections through the firewall.
3. Create a user directory that can be accessed only by specified users.
4. Configure **vsftpd**.
5. Secure the FTP server.
6. Test your FTP connection with FileZilla.

Good luck, and be sure to check our other VPS tutorials!