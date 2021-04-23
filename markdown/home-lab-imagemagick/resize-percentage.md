## resize using %

**cd into the folder that holds the original jpgs**

```powershell
magick mogrify test.jpg -resize 50% -path ../jrt-resize test.jpg
```

resize using % folder

```powershell
magick mogrify -resize 50% -path ../icon *.png
```