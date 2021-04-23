# How to Create a New User

Log into mysql using the 'root' user:
```mysql
mysql -u root -p
```
Use the new password you gave to the 'root' user when you installed mysql.
Hopefully you set up the database properly in the previous tutorial. 
When I first started I screwed it up many many times because I always rushed and didn’t actually read the info in the terminal window. Almost all of the instructions are there... step by step.

**The following command lets you view all users.**
```mysql
select user,host from mysql.user;
```
### GRANT PRIVILEGES
The first thing to do is to provide the **''root''** user with access to the information they will need.
```mysql
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY ‘password’;
```
This specific command allows to the **''root''** user to read, edit, execute and perform all tasks across all the databases and tables.

### FLUSH-PRIVILEGES
Once you have finalized the permissions for the ''root'' user, always be sure to reload all the privileges.
```mysql
FLUSH PRIVILEGES;
```
### QUIT (quit)	
Your changes will now be in effect for ''root''. Quit out of mysql and setup another user other than 'root'.

The steps are the same except we need to create a NEW user.  Login again using the root user.
```mysql
mysql -u root -p
```
### CREATE USER
Give the command to create  a new user within the MySQL shell:
```mysql
CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';
```
At this point 'newuser' (keep ‘'newuser'’ or exchange it for a name you would like) has no permissions to do anything with the databases. In fact, even if 'newuser' tries to login (with the password, password), they will not be able to reach the MySQL shell.

In this example we are granting 'newuser' full **''root''** access to everything in our database and can put your database’s security at high risk.
```mysql
GRANT ALL PRIVILEGES ON *.* TO 'newuser'@'localhost' IDENTIFIED BY ‘password’;
```
Once you have finalized the permissions that you want to set up for your new users, always be sure to reload all the privileges.
```mysql
FLUSH PRIVILEGES;
```
### SHOW GRANTS
Your changes will now be in effect.
```MYSQL
SHOW GRANTS;
```
You can also review a specific user’s current permissions by running the following:
```mysql
SHOW GRANTS FOR 'username'@'localhost';
```
[Official MySQL - GRANTs page](https://dev.mysql.com/doc/refman/5.7/en/grant.html)

### OTHER COMMANDS

This is a list of other common possible permissions that users can enjoy.

ALL PRIVILEGES- as we saw previously, this would allow a MySQL user full access to a designated database (or if no database is selected, global access across the system)
CREATE- allows them to create new tables or databases
DROP- allows them to them to delete tables or databases
DELETE- allows them to delete rows from tables
INSERT- allows them to insert rows into tables
SELECT- allows them to use the SELECT command to read through databases
UPDATE- allow them to update table rows
GRANT OPTION- allows them to grant or remove other users’ privileges
To provide a specific user with a permission, you can use this framework:

**Each time you update or change a permission be sure to use the Flush Privileges command.**
```mysql
FLUSH PRIVILEGES;
```
If you need to revoke a permission, the structure is almost identical to granting it:

REVOKE type_of_permission ON database_name.table_name FROM ‘username’@‘localhost’;
Note that when revoking permissions, the syntax requires that you use FROM, instead of TO as we used when granting permissions.

DROP USER ‘username’@‘localhost’;
To test out your new user, log out by typing:
```mysql
quit
```
To log in again remember the following command.
```mysql
mysql -u [username] -p
```