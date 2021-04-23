# Backing Up Plex Media Server Data

As conscientious computer users, we’re sure that you already make regular backups of all your data. However, there may be cases where you want to make a specific backup of just your Plex Media Server content (viewstates, metadata, settings, etc.). Doing so is easy, but the method and locations will vary depending on your operating system.



## Back Up Main Plex Media Server Data

For your operating system, make a backup of the main Plex Media Server data directory. The location will vary by platform.

**Tip!**: In many cases, you may find it beneficial to “zip” or “tar” (or similar) the contents of the data directory. The larger your library, the more useful this may be for you as it could otherwise take a very long time to process thousands of individual small metadata files.

**Tip!**: For Windows and Linux systems, you can exclude the `Cache` directory, if desired. That can save space and time in the transfer.

**Related Page**: [Where is the Plex Media Server data directory located?](https://support.plex.tv/articles/202915258-where-is-the-plex-media-server-data-directory-located/)



## Back Up Additional Settings

In addition to the main files, there may also be some additional special settings that should also be backed up.

### Windows

Certain Plex Media Server settings are stored in the registry on Windows. In the registry, they’re located under:

```
HKEY_CURRENT_USER\Software\Plex, Inc.\Plex Media Server
```

You can make a standard backup of either the full registry or only the specific “Plex Media Server” registry key.

**Related Page**: [Microsoft – Back up the registry](http://windows.microsoft.com/en-us/windows/back-up-registry)

### OS X

Using the Finder’s “Go” menu, select Go To Folder… then enter the following in the dialog box that pops up:

```
~/Library/Preferences/
```

Back up the `com.plexapp.plexmediaserver.plist` file.

### Linux & NAS

In Linux and on NAS devices, the `preferences.xml` file in the main Plex Media Server directory contains the corresponding settings. So, that means there isn’t anything else special that you need to back up.

### NVIDIA SHIELD

On NVIDIA SHIELD, the `preferences.xml` file in the main Plex Media Server directory contains the corresponding settings. So, that means there isn’t anything else special that you need to back up.



## Restoring the Backup

If you need to restore your backed up data, it’s as simple as putting the main data back in the original location (as noted above). Then, restore the “additional settings” mentioned above, which would be restoring the registry data on Windows or the `.plist` file for OS X.

After you install the backed up data, you can re-install the Plex Media Server application.