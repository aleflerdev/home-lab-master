### Create a User and Add to Group

This is useful for creating a new user on the fly for a specific software application. Enter the following:

```bash
sudo useradd –G new_group new_user
```

Next, assign a password to the new user:

```bash
sudo passwd new_user
```