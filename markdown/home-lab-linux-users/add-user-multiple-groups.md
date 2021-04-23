### Add a User to Multiple Groups at Once

Use the **`usermod`** command to specify multiple groups to add to:

```bash
sudo usermod –a –G new_group,new_group2,new_group3 user_name
```