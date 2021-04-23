Get-PSReadlineKeyHandler | ? {$_.function -like '*hist*'}

Key       Function                Description
---       --------                -----------
UpArrow   PreviousHistory         Replace the input with the previous item in the history
DownArrow NextHistory             Replace the input with the next item in the history
Ctrl+r    ReverseSearchHistory    Search history backwards interactively
Ctrl+s    ForwardSearchHistory    Search history forward interactively
Alt+F7    ClearHistory            Remove all items from the command line history (not PowerShell history)
F8        HistorySearchBackward   Search for the previous item in the history that starts with the current input - like NextHistory if the input is empty
Shift+F8  HistorySearchForward    Search for the next item in the history that starts with the current input - like NextHistory if the input is empty
Unbound   ViSearchHistoryBackward Starts a new seach backward in the history.
Unbound   BeginningOfHistory      Move to the first item in the history
Unbound   EndOfHistory            Move to the last item (the current input) in the history













The command history can be configured using **Get-PSReadlineOption** and **Set-PSReadlineOption** cmdlets. Current settings can be viewed using this command:

```
Get-PSReadlineOption | select HistoryNoDuplicates, MaximumHistoryCount, HistorySearchCursorMovesToEnd, HistorySearchCaseSensitive, HistorySavePath, HistorySaveStyle
```

[![Get-PSReadlineOption](http://woshub.com/wp-content/uploads/2015/12/Get-PSReadlineOption.jpg)](http://woshub.com/wp-content/uploads/2015/12/Get-PSReadlineOption.jpg)



The settings of the following parameters can be important for us:

- **HistoryNoDuplicates** – determines whether the same commands have to be saved;

- **MaximumHistoryCount** – the maximum number of the stored commands (by default the last 4096 commands are saved);

- **HistorySearchCursorMovesToEnd** — determines whether you have to go to the end of the command when searching;

- **HistorySearchCaseSensitive** – determines whether search is case sensitive;

- **HistorySavePath** – shows the path to the file in which the command is stored;

- HistorySaveStyle

   

  – determines the peculiarities of saving commands:

  - ***SaveIncrementally\*** — the commands are saved after they are run (by default);
  - ***SaveAtExit\*** *—* the history is saved when the PowerShell console is closed;
  - ***SaveNothing\*** — disable saving command history.

You can change the settings of PSReadLine module using **Set-PSReadlineOption**, for example:

```
Set-PSReadlineOption -HistorySaveStyle SaveAtExit
```

[![Set-PSReadlineOption](http://woshub.com/wp-content/uploads/2015/12/Set-PSReadlineOption.jpg)](http://woshub.com/wp-content/uploads/2015/12/Set-PSReadlineOption.jpg)

So, the ability to save the history of PowerShell commands is one of the arguments to prefer PoSh 5.0 to cmd.







## How to clear the Command History in PowerShell

As we explained above, the PSReadline module saves all the PowerShell console commands to a text file. However, in some cases, the administrator has to enter various confidential information in the PowerShell console (credentials, passwords, addresses, personal data, etc.). Thus, another server administrator or attacker can access the history data in a plain text file. For security reasons, you might need to clear the history of the executed PowerShell commands or completely disable the command history.

The **Clear-History** cmdlet can not be used to clear the history of commands. It clears only the list of previous commands that the Get-History cmdlet displays.



To delete the history of previous PoSh commands, you need to delete the file in which they are stored. The easiest way to do this is with the command:

```
Remove-Item (Get-PSReadlineOption).HistorySavePath
```

After that, close the PoSh window.

If you want to completely disable saving the history of PoSh commands to a text file, run the command:

```
Set-PSReadlineOption -HistorySaveStyle SaveNothing
```















## How to Export / Import PowerShell Session History

Sometimes it is convenient to have the same set of frequently used PowerShell commands on different computers. You can export the current command history on your computer to an xml file and import it to other computers. Also this can be done by copying the ConsoleHost_history.txt file to user profiles on the desired computers.

To export commands from the current session to a file, you can use the Export-Clixml cmdlet:

```
Get-History | Export-Clixml -Path c:\ps\commands_hist.xml
```

To import commands history from a file into a PoSh session:

```
Add-History -InputObject (Import-Clixml -Path c:\ps\commands_hist.xml)
```

[![export import powershell history](http://woshub.com/wp-content/uploads/2015/12/export-import-powershell-history.jpg)](http://woshub.com/wp-content/uploads/2015/12/export-import-powershell-history.jpg)

To automatically import commands to a file at the end of a PoSh session, you can bind the script to the event of the PoSh session termination (!! The session must be necessarily ended with the command `exit`, rather than simply closing the PowerShell window):

```
$HistFile = Join-Path ([Environment]::GetFolderPath('UserProfile')) .ps_historyRegister-EngineEvent PowerShell.Exiting -Action { Get-History | Export-Clixml $HistFile } | out-nullif (Test-path $HistFile) { Import-Clixml $HistFile | Add-History }
```