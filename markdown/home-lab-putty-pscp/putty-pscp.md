Generic Example

`pscp c:\documents\info.txt userid@server.example.com:/tmp/foo/info.txt`

Personal Example :

```powershell
c:\Program Files\PuTTY>pscp f:\Resume-Online\alefler-online-cv\index.html j1jwhpxk9kxy@aaronlefler.com:"public_html"
```
```powershell
c:\Program Files\PuTTY>pscp f:\Resume-Online\alefler-online-cv\style.min.css j1jwhpxk9kxy@aaronlefler.com:"public_html"
```

Add Putty folder to Environment Variables (PATH)

The following sets PATH just for the "current" cmd session.

```powershell
set PATH="C:\Program Files\Putty\";%PATH%
```

