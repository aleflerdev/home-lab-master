## How to Add User to Group

### Add an Existing User to an Existing Group

Use the **`adduser`** command to add a user to a group:

```bash
sudo adduser user_name new_group
```

Use the **`useradd`** command to add a user:

```output
sudo useradd –G new_group user_name
```

You can also use the **`usermod`** command to add a user to a group:

```output
sudo usermod –a –G group_name user_name
```

The **`usermod`** command uses the **`–append`** and **`–group`** options to append the user to a particular group. Without using **`–append`**, the user could be dropped from other groups.