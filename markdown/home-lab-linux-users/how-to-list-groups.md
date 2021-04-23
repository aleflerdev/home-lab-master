## How to List Groups in Linux

Linux comes with several different groups by default. Some of these, like the [sudo group](https://phoenixnap.com/kb/how-to-create-sudo-user-on-ubuntu), can be used to grant permissions. Others are hidden, used for system tasks.

To view a list of groups on your system by displaying the **/etc/groups** file:

```bash
sudo nano /etc/groups
```

To display the groups that a user belongs to with the `**groups**` command:

```bash
groups
```

The image above shows the groups that the logged-in user ‘sofija’ belongs to. You can display groups for a different user by specifying the username:

```bash
groups other_user
```

Another method to display the groups a user belongs to, including user ID (uid) and group ID (gid), is to use the `**id**` command:

```bash
id user_name
```