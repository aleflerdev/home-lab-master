## Apache 2.x on Unix systems[ ¶](https://www.php.net/manual/en/install.unix.apache2.php#install.unix.apache2)

[» Apache download site](http://httpd.apache.org/)

1. Obtain the Apache HTTP server from the location listed above, and unpack it:

   ```
   tar -xzf httpd-2.x.NN.tar.gz
   ```

2. Likewise, obtain and unpack the PHP source:

   ```
   tar -xzf php-NN.tar.gz
   ```

3. Build and install Apache. Consult the Apache install documentation for more details on building Apache.

   ```
   cd httpd-2_x_NN
   ./configure --enable-so
   make
   make install
   ```

4. Now you have Apache 2.x.NN available under /usr/local/apache2, configured with loadable module support and the standard MPM prefork. To test the installation use your normal procedure for starting the Apache server, e.g.:

   ```
   /usr/local/apache2/bin/apachectl start
   ```

   and stop the server to go on with the configuration for PHP:

   ```
   /usr/local/apache2/bin/apachectl stop
   ```

5. Now, configure and build PHP. This is where you customize PHP with various options, like which extensions will be enabled. Run ./configure --help for a list of available options. In our example we'll do a simple configure with Apache 2 and MySQL support.

   If you built Apache from source, as described above, the below example will match your path for apxs, but if you installed Apache some other way, you'll need to adjust the path to apxs accordingly. Note that some distros may rename apxs to apxs2.

   ```
   cd ../php-NN
   ./configure --with-apxs2=/usr/local/apache2/bin/apxs --with-mysql
   make
   make install
   ```

   If you decide to change your configure options after installation, you'll need to re-run the configure, make, and make install steps. You only need to restart apache for the new module to take effect. A recompile of Apache is not needed.

   Note that unless told otherwise, 'make install' will also install PEAR, various PHP tools such as phpize, install the PHP CLI, and more.

6. Setup your php.ini

   ```
   cp php.ini-development /usr/local/lib/php.ini
   ```

   You may edit your .ini file to set PHP options. If you prefer having php.ini in another location, use --with-config-file-path=/some/path in step 5.

   If you instead choose php.ini-production, be certain to read the list of changes within, as they affect how PHP behaves.

7. Edit your httpd.conf to load the PHP module. The path on the right hand side of the LoadModule statement must point to the path of the PHP module on your system. The make install from above may have already added this for you, but be sure to check.

   For PHP 7:

   ```
   LoadModule php7_module modules/libphp7.so
   ```

1. Tell Apache to parse certain extensions as PHP. For example, let's have Apache parse .php files as PHP. Instead of only using the Apache AddType directive, we want to avoid potentially dangerous uploads and created files such as exploit.php.jpg from being executed as PHP. Using this example, you could have any extension(s) parse as PHP by simply adding them. We'll add .php to demonstrate.

   ```
   <FilesMatch \.php$>
       SetHandler application/x-httpd-php
   </FilesMatch>
   ```

   Or, if we wanted to allow .php, .php2, .php3, .php4, .php5, .php6, and .phtml files to be executed as PHP, but nothing else, we'd use this:

   ```
   <FilesMatch "\.ph(p[2-6]?|tml)$">
       SetHandler application/x-httpd-php
   </FilesMatch>
   ```

   And to allow .phps files to be handled by the php source filter, and displayed as syntax-highlighted source code, use this:

   ```
   <FilesMatch "\.phps$">
       SetHandler application/x-httpd-php-source
   </FilesMatch>
   ```

   mod_rewrite may be used To allow any arbitrary .php file to be displayed as syntax-highlighted source code, without having to rename or copy it to a .phps file:

   ```
   RewriteEngine On
   RewriteRule (.*\.php)s$ $1 [H=application/x-httpd-php-source]
   ```

   The php source filter should not be enabled on production systems, where it may expose confidential or otherwise sensitive information embedded in source code.

2. Use your normal procedure for starting the Apache server, e.g.:

   ```
   /usr/local/apache2/bin/apachectl start
   ```

   OR

   ```bash
   service httpd restart
   ```
