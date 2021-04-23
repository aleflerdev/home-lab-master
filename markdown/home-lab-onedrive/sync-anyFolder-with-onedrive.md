**Here's How:**

1 Open a **<u>command prompt</u>** (Windows Key then type cmd)

2 Type the command below into the command prompt, and press Enter. (see screenshot below)

```powershell
mklink /j "%UserProfile%\OneDrive\Folder Name" "Full path of source folder"
```
Substitute **Full path of source folder** in the command above with the actual full path of the folder (ex: "F:\Example Folder") you want to sync with your OneDrive.

Substitute **Folder Name** in the command above with the folder name (ex: "Example Folder") you want to show in OneDrive. This folder is a junction point of the source folder. It would be best to use the same name as the source folder to help know what it's linked to. **This must be a new folder name that isn't already in your OneDrive folder.** This specified folder will be created in your OneDrive folder.

**For example:** 

```powershell
mklink /j "%UserProfile%\OneDrive\Example Folder" "F:\Example Folder"
```

![](E:\home-lab-master\markdown\home-lab-onedrive\mklink_OneDrive_command.png)


3 The source folder (ex: "F:\Example Folder") will now be synced with your OneDrive (ex: "%UserProfile%\OneDrive\Example Folder"). Anything you **copy**, **save**, and **delete** in either of these two folders will also be applied to the other folder. (see screenshots below)



If you want to undo this junction point and stop syncing the source folder with your OneDrive, you would only delete the folder (ex: "%UserProfile%\OneDrive\Example Folder") in your OneDrive folder. This will not delete the source folder (ex: "F:\Example Folder"), but will also delete it from your online OneDrive.