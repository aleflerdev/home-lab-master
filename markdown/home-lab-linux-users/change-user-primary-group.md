### Change a Users Primary Group

All previous commands have been used to manage the secondary groups a user belongs to. In most cases, a user’s primary group is the same as their username.

To change a users primary group, enter the command:

```output
sudo usermod –g new_group user_name
```

The lower-case **`–g`** specifies the **primary** group. (Upper-case **`–G`** refers to a secondary group.) A user can only have one primary group, so the old primary group **user_name** won’t be primary anymore for this user.