#!/bin/bash 

sudo echo '<html>Hello World!</html>' > /var/www/html/index.html

echo "Hello, World"

sudo apt update

sudo apt upgrade

# Install Apache

sudo apt install apache2

# Restart Apache 2

systemctl restart apache2

# Default document root for storing your web files is /var/www/html/

# Configuration files for Apache2 are located in /etc/apache2 directory and the main configuration file is /etc//etc/apache2/apache2.conf

systemctl status apache2

# Step 2 Install MariaDB database

sudo apt install mariadb-server mariadb-client

# The MariaDB configuration files are stored under the /etc/mysql/ directory

# Confirm that the MariaDB database service is running and is enabled

systemctl status mariadb

systemctl start mariadb

# mysql_secure_installation

# Step 3 PHP

sudo apt install php libapache2-mod-php php-mysql

# The PHP configuration file will be located in /etc/php/7.2/

sudo systemctl restart apache2

# Now test PHP installed correctly - Create info.php under /var/www/html/

sudo chown -R aaron /var/www

sudo chmod -R 755 /var/www

sudo echo '<?php phpinfo(); ?>' > /var/www/html/info.php

Step 4 phpmyadmin

sudo apt install phpmyadmin

sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf

sudo a2enconf phpmyadmin.conf

sudo systemctl restart apache2

sudo echo '<html><head><title>Hello World!</title></head><body>Hello World!</body></html>' /var/www/html/index.html

echo "I've never failed at anything. Except life."
