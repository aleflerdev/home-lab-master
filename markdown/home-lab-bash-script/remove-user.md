# Remove a Linux user

You can remove old users from your Linux server. This will revoke the user's SSH access, and remove that user's file and directory ownership.
 **Note:** This procedure should work for all Linux distribution types - Ubuntu, CentOS, and so on.
1. Log in to your server via SSH.
2. Switch to the root user:
```bash
sudo su -
```
3. Use the
```bash
userdel
```
command to remove the old user:
```bash
   userdel *user's username*
```
4. Optional:
5. You can also delete that user's home directory and mail spool by using the
```bash
-r
```
flag with the command:
```bash
userdel -r *user's username*
```