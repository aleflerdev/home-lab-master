## How to Remove a User From a Group

The **gpasswd** tool is used for managing groups. To remove a user from a group:

```bash
sudo gpasswd –d user_name new_group
```

**Note:** The **gpasswd** tool canbe used for other administrative tasks such as defining group administrators and setting a password for access to group resources. Use the **`man gpasswd`** command for details.

### Delete a Group

To delete a group, use the command:

```bash
sudo groupdel new_group
```