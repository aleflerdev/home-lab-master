've been talking about it for months, but in case you haven't heard, there's a new [Windows Terminal](https://www.hanselman.com/blog/ANewConsoleForWindowsItsTheOpenSourceWindowsTerminal.aspx) in town. You can download it and start using it now [from the Windows Store](https://www.microsoft.com/es-do/p/windows-terminal-preview/9n0dx20hk701?cid=storebadge&ocid=badge&rtc=1&activetab=pivot:overviewtab&WT.mc_id=-blog-scottha). It's free and open source.

At the time of this writing, Windows Terminal is around version 0.5. It's not officially released as a 1.0 so things are changing all the time.

Here's **your todo** - Have you installed the Windows Terminal before? Have you customize your profile.json file? If so, I want you to DELETE your profiles.json!

Your profiles.json is somewhere like C:\Users\USERNAME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState but you can get to it from the drop down in the Windows Terminal like this:

![Windows Terminal dropdown](https://www.hanselman.com/blog/content/binary/Windows-Live-Writer/5949f982c134_1496C/image_5572ddd8-9f84-4a5d-a351-250d5667d0c3.png)

When you hit Settings, Windows Terminal will launch whatever app is registered to handle JSON files. In my case, I'm using Visual Studio Code.

I have done a lot of customization on my profiles.json, so before I delete or "zero out" my profiles.json I will save a copy somewhere. You should to!

You can just "ctrl-a" and delete all of your profiles.json when it's open and Windows Terminal 0.5 or greater will **recreate it from scratch by detecting the shells you have.** Remember, [a Console or Terminal isn't a Shell](https://www.hanselman.com/blog/WhatsTheDifferenceBetweenAConsoleATerminalAndAShell.aspx)!

Note the new profiles.json also includes another tip! You can hold ALT- and click settings to see the default settings! This new profiles.json is simpler to read and understand because there's an inherited default.

```
// To view the default settings, hold "alt" while clicking on the "Settings" button.``// For documentation on these settings, see: https://aka.ms/terminal-documentation` `{``  ``"$schema"``: ``"https://aka.ms/terminal-profiles-schema"``,` `  ``"defaultProfile"``: ``"{61c54bbd-c2c6-5271-96e7-009a87ff44bf}"``,` `  ``"profiles"``:``  ``[``    ``{``      ``// Make changes here to the powershell.exe profile``      ``"guid"``: ``"{61c54bbd-c2c6-5271-96e7-009a87ff44bf}"``,``      ``"name"``: ``"Windows PowerShell"``,``      ``"commandline"``: ``"powershell.exe"``,``      ``"hidden"``: ``false``    ``},``    ``{``      ``// Make changes here to the cmd.exe profile``      ``"guid"``: ``"{0caa0dad-35be-5f56-a8ff-afceeeaa6101}"``,``      ``"name"``: ``"cmd"``,``      ``"commandline"``: ``"cmd.exe"``,``      ``"hidden"``: ``false``    ``},``    ``{``      ``"guid"``: ``"{574e775e-4f2a-5b96-ac1e-a2962a402336}"``,``      ``"hidden"``: ``false``,``      ``"name"``: ``"PowerShell Core"``,``      ``"source"``: ``"Windows.Terminal.PowershellCore"``    ``},``...
```

You'll notice there's a new $schema that gives you dropdown Intellisense so you can autocomplete properties and their values now! Check out the [Windows Terminal Documentation](https://aka.ms/terminal-documentation) here https://aka.ms/terminal-documentation and the [complete list of things you can do in your profiles.json is here](https://github.com/microsoft/terminal/blob/master/doc/cascadia/SettingsSchema.md?WT.mc_id=-blog-scottha).

I've made these changes to my Profile.json.

![Split panes](https://www.hanselman.com/blog/content/binary/Windows-Live-Writer/5949f982c134_1496C/image_4a4db7df-e017-479c-8ecd-7ed16d00301f.png)

I've added "requestedTheme" and changed it to dark, to get a black titleBar with tabs.

![requestedTheme = dark ](https://www.hanselman.com/blog/content/binary/Windows-Live-Writer/5949f982c134_1496C/image_66f609cd-cbaf-4060-90b4-131f9c78f0f6.png)

I also wanted to test the new (not even close to done) splitscreen features, that give you a simplistic tmux style of window panes, without any other software.
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
// To view the default settings, hold "alt" while clicking on the "Settings" button.
// For documentation on these settings, see: https://aka.ms/terminal-documentation
 
{
    "$schema": "https://aka.ms/terminal-profiles-schema",
 
    "defaultProfile": "{61c54bbd-c2c6-5271-96e7-009a87ff44bf}",
 
    "profiles":
    [
        {
            // Make changes here to the powershell.exe profile
            "guid": "{61c54bbd-c2c6-5271-96e7-009a87ff44bf}",
            "name": "Windows PowerShell",
            "commandline": "powershell.exe",
            "hidden": false
        },
        {
            // Make changes here to the cmd.exe profile
            "guid": "{0caa0dad-35be-5f56-a8ff-afceeeaa6101}",
            "name": "cmd",
            "commandline": "cmd.exe",
            "hidden": false
        },
        {
            "guid": "{574e775e-4f2a-5b96-ac1e-a2962a402336}",
            "hidden": false,
            "name": "PowerShell Core",
            "source": "Windows.Terminal.PowershellCore"
        },
...

Then I added an Ubuntu specific color scheme, named UbuntuLegit.

```
// Add custom color schemes to this array``"schemes"``: [``  ``{``    ``"background"` `: ``"#2C001E"``,``    ``"black"` `: ``"#4E9A06"``,``    ``"blue"` `: ``"#3465A4"``,``    ``"brightBlack"` `: ``"#555753"``,``    ``"brightBlue"` `: ``"#729FCF"``,``    ``"brightCyan"` `: ``"#34E2E2"``,``    ``"brightGreen"` `: ``"#8AE234"``,``    ``"brightPurple"` `: ``"#AD7FA8"``,``    ``"brightRed"` `: ``"#EF2929"``,``    ``"brightWhite"` `: ``"#EEEEEE"``,``    ``"brightYellow"` `: ``"#FCE94F"``,``    ``"cyan"` `: ``"#06989A"``,``    ``"foreground"` `: ``"#EEEEEE"``,``    ``"green"` `: ``"#300A24"``,``    ``"name"` `: ``"UbuntuLegit"``,``    ``"purple"` `: ``"#75507B"``,``    ``"red"` `: ``"#CC0000"``,``    ``"white"` `: ``"#D3D7CF"``,``    ``"yellow"` `: ``"#C4A000"``  ``}``],
```

And finally, I added a custom command prompt that runs Mono's x86 developer prompt.

```
{``  ``"guid"``: ``"{b463ae62-4e3d-5e58-b989-0a998ec441b8}"``,``  ``"hidden"``: ``false``,``  ``"name"``: ``"Mono"``,``  ``"fontFace"``: ``"DelugiaCode NF"``,``  ``"fontSize"``: 16,``  ``"commandline"``: ``"C://Windows//SysWOW64//cmd.exe /k \"C://Program Files (x86)//Mono//bin//setmonopath.bat\""``,``  ``"icon"``: ``"c://Users//scott//Dropbox//mono.png"``}
```

Note I'm using forward slashes an double escaping them, as well as backslash escaping quotes.

Save your profiles.json away somewhere, make sure your Terminal is updated, then delete it or empty it and you'll likely get some new "free" shells that the Terminal will detect, then you can copy in just the few customizations you want.