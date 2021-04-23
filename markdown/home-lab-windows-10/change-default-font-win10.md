## Steps to change the default font in Windows 10

So before you jump in and learn the art of spicing things up for your PC, just be cautious about messing things up when you’re modifying the registry. We suggest you create a system restore point that you can revert back to in case something goes wrong. Once you’ve done that, get started by following the steps below:

**Step 1:** Launch the ***Control Panel*** from the ***Start Menu.***

**Step 2:** Click on the “***Appearance and Personalization***” option from the side menu.

**Step 3:** Click on “***Fonts***” to open fonts and select the name of the one you want to use as default.

**Step 4:** Now open the Notepad application and paste the following code into the empty text file:
```markdown
Windows Registry Editor Version 5.00
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts]
"Open Sans Bold (TrueType)"=""
"Open Sans Condensed Bold (TrueType)"=""
"Open Sans Condensed Light (TrueType)"=""
"Open Sans Condensed Light Italic (TrueType)"=""
"Open Sans ExtraBold (TrueType)"=""
"Open Sans ExtraBold Italic (TrueType)"=""
"Open Sans Bold Italic (TrueType)"=""
"Open Sans Italic (TrueType)"=""
"Open Sans Light (TrueType)"=""
"Open Sans Light Italic (TrueType)"=""
"Open Sans Regular (TrueType)"=""
"Open Sans Semibold (TrueType)"=""
"Open Sans SemiBold Italic (TrueType)"=""
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontSubstitutes]
"Open Sans"="NewFont"
```
**Step 5:** Be sure to replace the font name you want to change Open Sans within the last line of the registry code

**Step 6:** Click on File on the top menu options and then save your file as a .reg file by using the extension option “All files”

**Step 7:** From wherever your file is saved, double-click on it to merge it with the registry by clicking Yes and OK

**Step 8:** Simply restart your computer to let the changes take effect