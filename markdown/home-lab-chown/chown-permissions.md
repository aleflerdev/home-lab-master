# Linux chown command

There are three major types of file permissions:

**User permissions** 
- These permissions apply to a single user who has special access to the file. This user is called the owner.
**Group permissions**
- These apply to a single group of users who have access to the file. This group is the owning group.
**Other permissions**
- These apply to every other user on the system. These users are known as others, or the world.

# File ownership
## user owner and group owner
The **users** and **groups** of a system can be locally managed in /etc/passwd and /etc/group, or they can be in a NIS, LDAP, or Samba domain. These users and groups can own files. Actually, every file has a user owner and a group owner, as can be seen in the following screenshot.
```bash
paul@rhel65:~/owners$ ls -lh
total 636K
-rw-r--r--. 1 paul snooker 1.1K Apr  8 18:47 data.odt
-rw-r--r--. 1 paul paul    626K Apr  8 18:46 file1
-rw-r--r--. 1 root tennis   185 Apr  8 18:46 file2
-rw-rw-r--. 1 root root       0 Apr  8 18:47 stuff.txt
paul@rhel65:~/owners$
```
User paul owns three files; file1 has paul as user owner and has the group paul as group owner, data.odt is group owned by the group snooker, file2 by the group tennis.

The last file is called stuff.txt and is owned by the root user and the root group.

## listing user accounts

You can use the following command to list all local user accounts.
```bash
paul@debian7~$ cut -d: -f1 /etc/passwd | column 
root            ntp             sam             bert            naomi
daemon          mysql           tom             rino            matthias2
bin             paul            wouter          antonio         bram
sys             maarten         robrecht        simon           fabrice
sync            kevin           bilal           sven            chimene
games           yuri            dimitri         wouter2         messagebus
man             william         ahmed           tarik           roger
lp              yves            dylan           jan             frank
mail            kris            robin           ian             toon
news            hamid           matthias        ivan            rinus
uucp            vladimir        ben             azeddine        eddy
proxy           abiy            mike            eric            bram2
www-data        david           kevin2          kamel           keith
backup          chahid          kenzo           ischa           jesse
list            stef            aaron           bart            frederick
irc             joeri           lorenzo         omer            hans
gnats           glenn           jens            kurt            dries
nobody          yannick         ruben           steve           steve2
libuuid         christof        jelle           constantin      tomas
Debian-exim     george          stefaan         sam2            johan
statd           joost           marc            bjorn           tom2
sshd            arno            thomas          ronald
```
## chgrp

You can change the group owner of a file using the chgrp command.
```bash
root@rhel65:/data/sites/web/cobbautbe/subsites/owners# ls -l file2
-rw-r--r--. 1 root tennis 185 Apr  8 18:46 file2
root@rhel65:/data/sites/web/cobbautbe/subsites/owners# chgrp snooker file2
root@rhel65:/data/sites/web/cobbautbe/subsites/owners# ls -l file2
-rw-r--r--. 1 root snooker 185 Apr  8 18:46 file2
root@rhel65:/data/sites/web/cobbautbe/subsites/owners#
```
## chown

The user owner of a file can be changed with chown command.
```bash
root@laika:/data/sites/web/cobbautbe/subsites# ls -l FileForPaul 
-rw-r--r-- 1 root paul 0 2008-08-06 14:11 FileForPaul
root@laika:/data/sites/web/cobbautbe/subsites# chown paul FileForPaul 
root@laika:/data/sites/web/cobbautbe/subsites# ls -l FileForPaul 
-rw-r--r-- 1 paul paul 0 2008-08-06 14:11 FileForPaul
```
You can also use chown to change both the user owner and the group owner.
```bash
root@laika:/data/sites/web/cobbautbe/subsites# ls -l FileForPaul 
-rw-r--r-- 1 paul paul 0 2008-08-06 14:11 FileForPaul
root@laika:/data/sites/web/cobbautbe/subsites# chown root:project42 FileForPaul 
root@laika:/data/sites/web/cobbautbe/subsites# ls -l FileForPaul 
-rw-r--r-- 1 root project42 0 2008-08-06 14:11 FileForPaul
```
## list of special files

When you use ls -l, for each file you can see ten characters before the user and group owner. The first character tells us the type of file. Regular files get a -, directories get a d, symbolic links are shown with an l, pipes get a p, character devices a c, block devices a b, and sockets an s.

Table 32.1. Unix special files

|first character|	file type|
|-----|-----|
|-|	normal file|
|d|	directory|
|l|	symbolic link|
|p|	named pipe|
|b|	block device|
|c|	character device|
|s|	socket|

Below a screenshot of a character device (the console) and a block device (the hard disk).
```bash
paul@debian6lt~$ ls -ld /dev/console /dev/sda
crw-------   1 root root  5, 1 Mar 15 12:45 /dev/console
brw-rw----   1 root disk  8, 0 Mar 15 12:45 /dev/sda
```
And here you can see a directory, a regular file and a symbolic link.
```bash
paul@debian6lt~$ ls -ld /etc /etc/hosts /etc/motd
drwxr-xr-x 128 root root 12288 Mar 15 18:34 /etc
-rw-r--r--   1 root root   372 Dec 10 17:36 /etc/hosts
lrwxrwxrwx   1 root root    13 Dec  5 10:36 /etc/motd -> /var/run/motd
permissions
rwx
```
The nine characters following the file type denote the permissions in three triplets. A permission can be r for read access, w for write access, and x for execute. You need the r permission to list (ls) the contents of a directory. You need the x permission to enter (cd) a directory. You need the w permission to create files in or remove files from a directory.

Table 32.2. standard Unix file permissions

| permission  | on a file                 | on a directory           |
| ----------- | ------------------------- | ------------------------ |
| r (read)    | read file contents (cat)  | read directory contents  |
| w (write)   | change file contents (vi) | create files in (touch)  |
| x (execute) | execute the file          | enter the directory (cd) |

### three sets of rwx
We already know that the output of ls -l starts with ten characters for each file. This screenshot shows a regular file (because the first character is a - ).
```bash
paul@RHELv4u4:~/test$ ls -l proc42.bash
-rwxr-xr--  1 paul proj 984 Feb  6 12:01 proc42.bash
```
Below is a table describing the function of all ten characters.

## Table 32.3. Unix file permissions position

| position | characters | function                        |
| -------- | ---------- | ------------------------------- |
| 1        | -          | this is a regular file          |
| 2-4      | rwx        | permissions for the user owner  |
| 5-7      | r-x        | permissions for the group owner |
| 8-10     | r--        | permissions for others          |

When you are the user owner of a file, then the user owner permissions apply to you. The rest of the permissions have no influence on your access to the file.

When you belong to the group that is the group owner of a file, then the group owner permissions apply to you. The rest of the permissions have no influence on your access to the file.

When you are not the user owner of a file and you do not belong to the group owner, then the others permissions apply to you. The rest of the permissions have no influence on your access to the file.

## permission examples

Some example combinations on files and directories are seen in this screenshot. The name of the file explains the permissions.
```bash
paul@laika:~/perms$ ls -lh
total 12K
drwxr-xr-x 2 paul paul 4.0K 2007-02-07 22:26 AllEnter_UserCreateDelete
-rwxrwxrwx 1 paul paul    0 2007-02-07 22:21 EveryoneFullControl.txt
-r--r----- 1 paul paul    0 2007-02-07 22:21 OnlyOwnersRead.txt
-rwxrwx--- 1 paul paul    0 2007-02-07 22:21 OwnersAll_RestNothing.txt
dr-xr-x--- 2 paul paul 4.0K 2007-02-07 22:25 UserAndGroupEnter
dr-x------ 2 paul paul 4.0K 2007-02-07 22:25 OnlyUserEnter
paul@laika:~/perms$
```
To summarise, the first rwx triplet represents the permissions for the user owner. The second triplet corresponds to the group owner; it specifies permissions for all members of that group. The third triplet defines permissions for all other users that are not the user owner and are not a member of the group owner.

## setting permissions (chmod)

Permissions can be changed with chmod. The first example gives the user owner execute permissions.
```bash
paul@laika:~/perms$ ls -l permissions.txt 
-rw-r--r-- 1 paul paul 0 2007-02-07 22:34 permissions.txt
paul@laika:~/perms$ chmod u+x permissions.txt 
paul@laika:~/perms$ ls -l permissions.txt 
-rwxr--r-- 1 paul paul 0 2007-02-07 22:34 permissions.txt
```
This example removes the group owners read permission.
```bash
paul@laika:~/perms$ chmod g-r permissions.txt 
paul@laika:~/perms$ ls -l permissions.txt 
-rwx---r-- 1 paul paul 0 2007-02-07 22:34 permissions.txt
```
This example removes the others read permission.
```bash
paul@laika:~/perms$ chmod o-r permissions.txt 
paul@laika:~/perms$ ls -l permissions.txt 
-rwx------ 1 paul paul 0 2007-02-07 22:34 permissions.txt
```
This example gives all of them the write permission.
```bash
paul@laika:~/perms$ chmod a+w permissions.txt 
paul@laika:~/perms$ ls -l permissions.txt 
-rwx-w--w- 1 paul paul 0 2007-02-07 22:34 permissions.txt
```
You don't even have to type the a.
```bash
paul@laika:~/perms$ chmod +x permissions.txt 
paul@laika:~/perms$ ls -l permissions.txt 
-rwx-wx-wx 1 paul paul 0 2007-02-07 22:34 permissions.txt
```
You can also set explicit permissions.
```bash
paul@laika:~/perms$ chmod u=rw permissions.txt 
paul@laika:~/perms$ ls -l permissions.txt 
-rw--wx-wx 1 paul paul 0 2007-02-07 22:34 permissions.txt
```
Feel free to make any kind of combination.

```bash
paul@laika:~/perms$ chmod u=rw,g=rw,o=r permissions.txt 
paul@laika:~/perms$ ls -l permissions.txt 
-rw-rw-r-- 1 paul paul 0 2007-02-07 22:34 permissions.txt
```
Even fishy combinations are accepted by chmod.
```bash
paul@laika:~/perms$ chmod u=rwx,ug+rw,o=r permissions.txt 
paul@laika:~/perms$ ls -l permissions.txt 
-rwxrw-r-- 1 paul paul 0 2007-02-07 22:34 permissions.txt
```