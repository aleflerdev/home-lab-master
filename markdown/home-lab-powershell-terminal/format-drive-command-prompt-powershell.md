## How to format a USB flash drive using Command Prompt

Alternatively, you can also use Command Prompt to format a USB flash  drive to delete the file system table and data. Or you can also use the  tool to clean the drive and start fresh with a new partition and file  system table.

### Formatting flash drive

To perform a quick or full format of a USB flash drive using Command Prompt, use these steps:

1. Open **Start**.

2. Search for **Command Prompt**, right-click the top result, and select the **Run as administrator** option.

3. Type the following command to perform a quick format of the USB flash drive and press **Enter** (twice):

   `format VOLUME: /v:FLASHDRIVE-LABEL /fs:FILE-SYSTEM /q`

   In the command, make sure to replace the "VOLUME" with the correct  drive letter of the storage, "FLASHDRIVE-LABEL" with the name you want  the drive to appear in File Explorer, "FILE-SYSTEM" with one of the  available file systems, including "FAT32," "exFAT," or "NTFS"  (recommended).

   This example is a quick format of the E drive:

   `format E: /v:workFlash /fs:NTFS /q`

   [![img](https://www.windowscentral.com/sites/wpcentral.com/files/styles/w830/public/field/image/2019/08/quick-format-ntfs-cmd_windows-10.jpg?itok=O9y4ctWU)](https://www.windowscentral.com/sites/wpcentral.com/files/styles/xlarge/public/field/image/2019/08/quick-format-ntfs-cmd_windows-10.jpg?itok=O9y4ctWU)

4. (Optional) Type the following command to perform a full format of the USB flash drive and press **Enter** (twice):

   `format VOLUME: /v:FLASHDRIVE-LABEL /fs:FILE-SYSTEM`

   This example performs a full format of the E drive:

   `format E: /v:"workFlash" /fs:NTFS`

After completing the steps, the thumb drive will be formatted with the option that you specified.

### Cleaning and formatting flash drive

To clean and format a USB thumb drive with Command Prompt, use these steps:

1. Open **Start**.

2. Search for **Command Prompt**, right-click the top result, and select the **Run as administrator** option. 

3. Type the following command to launch the diskpart tool and press **Enter**:

   `diskpart`

4. Type the following command to view a list of the available drives and press **Enter**:

   `list disk`

5. Type the following command to select the flash drive you want to delete and press **Enter**:

   `select disk DISK-NUMBER`

   In the command, make sure to replace "DISK-NUMBER" for the correct number that represents the drive you're trying to format.

   This example selects the flash drive listed as disk number 1:

   `select disk 1`

6. Type the following command to delete all the partitions and press **Enter**:

   `clean`

7. Type the following command to create a primary partition and press **Enter**:

   `create partition primary`

8. Type the following command to perform a quick format and press **Enter**:

   `format fs=FILE-SYSTEM label=DRIVE-NAME quick`

   In the command, make sure to replace "NTFS" for your preferred file  system, "workFlash" for the name you want to give the device, and if you don't specify the "quick" option, then a full format will be performed.

   This example quickly formats the removable storage using the NTFS file system:

   `format fs=NTFS label=workFlash quick`

   [![img](https://www.windowscentral.com/sites/wpcentral.com/files/styles/w830/public/field/image/2019/08/diskpart-format-usb-flash-drive.jpg?itok=4rJqttsJ)](https://www.windowscentral.com/sites/wpcentral.com/files/styles/xlarge/public/field/image/2019/08/diskpart-format-usb-flash-drive.jpg?itok=4rJqttsJ)

9. Type the following command to assign a drive letter and press **Enter**:

   `assign`

   **Quick note:** You can append "letter=e" in the command to assign (in this case) "E" as the drive letter. Otherwise, the system will assign a letter automatically.

10. Type the following command to terminate diskpart and press **Enter**:

    `exit`

Once you complete these steps, diskpart will remove any information  on the USB flash drive. It'll create a new partition and configure a  compatible file system to store files from your Windows 10, macOS, or  Linux machine (depending on your settings).



## How to format a USB flash drive using PowerShell

Similar to Command Prompt, you can use PowerShell to quickly format a removable flash drive to erase its content. Or you can also use the  command-line tool to clean and format the device, deleting its contents  and fixing issues.

### Formatting flash drive

To format a USB flash drive using PowerShell commands, use these steps:

1. Open **Start**.

2. Search for **PowerShell**, right-click the top result, and select the **Run as administrator** option.

3. Type the following command to perform a quick format on the flash drive and press **Enter**:

   `Format-Volume -DriveLetter DRIVE-LETTER -FileSystem FILE-SYSTEM`

   In the command, make sure to replace "DRIVE-LETTER" with the correct  letter that reflects the drive you want to format, and "FILE-SYSTEM" for FAT32, exFAT, or NTFS (recommended).

   This example performs a quick format of the E: drive:

   `Format-Volume -DriveLetter E -FileSystem NTFS`

   [![img](https://www.windowscentral.com/sites/wpcentral.com/files/styles/w830/public/field/image/2019/08/powshell-format-usb-drive-windows-10.jpg?itok=tpeQdOs2)](https://www.windowscentral.com/sites/wpcentral.com/files/styles/xlarge/public/field/image/2019/08/powshell-format-usb-drive-windows-10.jpg?itok=tpeQdOs2)

4. (Optional) Type the following command to perform a full format on the USB flash drive and press **Enter**:

   `Format-Volume -DriveLetter DRIVE-LETTER -FileSystem FILE-SYSTEM -Full -Force`

   This example performs a full format of the E: drive:

   `Format-Volume -DriveLetter E -FileSystem NTFS -Full -Force`

After completing the steps, PowerShell will format the removable storage with the settings you specified.

### Cleaning and formatting flash drive

To clean and format a removable drive with PowerShell commands, use these steps:

1. Open **Start**.

2. Search for **PowerShell**, right-click the top result, and select the **Run as administrator** option.

3. Type the following command to view the flash drive you want to fix and press **Enter**:

   `Get-Disk`

4. Type the following command to delete the volume and press **Enter**:

   `Get-Disk DISK-NUMBER | Clear-Disk -RemoveData`

   In the command, change "DISK-NUMBER" for the correct number that represents the flash drive you're formatting.

   This example selects and cleans the disk number 1:

   `Get-Disk 1 | Clear-Disk -RemoveData`

5. Type **Y** to confirm the action and press **Enter**.

6. Type the following command to create a new partition and press **Enter**:

   `New-Partition -DiskNumber DISK-NUMBER -UseMaximumSize`

   In the command, change "DISK-NUMBER" to the correct number that represents the flash drive you're formatting.

   This example creates a new partition using the entire space available on drive number 1:

   `New-Partition -DiskNumber 1 -UseMaximumSize`

7. Type the following command to perform a quick format and assign a drive label, and press **Enter**:

   `Get-Partition -DiskNumber DISK-NUMBER | Format-Volume -FileSystem FILE-SYSTEM -NewFileSystemLabel DRIVE-NAME`

   In the command, change "DISK-NUMBER" to the correct number of your  storage, "FILE-SYSTEM" for "NTFS," "FAT32," or "exFAT," and "DRIVE-NAME" with the name you want the device to appear in File Explorer.

   This example selects and formats drive number 1 using the NTFS file system:

   `Get-Partition -DiskNumber 1 | Format-Volume -FileSystem NTFS -NewFileSystemLabel workFlash`

   [![img](https://www.windowscentral.com/sites/wpcentral.com/files/styles/w830/public/field/image/2019/08/powershell-clean-format-usb-drive-windows-10.jpg?itok=UKEVv1Mq)](https://www.windowscentral.com/sites/wpcentral.com/files/styles/xlarge/public/field/image/2019/08/powershell-clean-format-usb-drive-windows-10.jpg?itok=UKEVv1Mq)

8. Type the following command to assign a new letter to the drive and press **Enter**:

   `Get-Partition -DiskNumber DISK-NUMBER | Set-Partition -NewDriveLetter DRIVE-LETTER`

   In the command, replace "DISK-NUMBER" for the correct number of your  removable storage, and "DRIVE-LETTER" with the letter you want the  device to appear in File Explorer.

   This example sets E as the drive letter for disk number 1:

   `Get-Partition -DiskNumber 1 | Set-Partition -NewDriveLetter E`

Once you complete these steps, similar to Command Prompt, PowerShell  will remove any information in the USB flash drive to fix problems,  including data corruption, write protection, and unrecognized drives.  Then it'll create a new partition and configure a compatible file system to store files from your Windows 10, macOS, or Linux machine (depending on your configuration).