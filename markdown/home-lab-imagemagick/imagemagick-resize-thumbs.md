## imagemagick resize example

#### resize | output files to different folder (thumbnails)

**cd into the folder that holds the original jpgs**

```powershell
magick mogrify test.jpg -resize 50% -path ../jrt-resize test.jpg
```

```powershell
magick mogrify -resize 100 -path ../jrt-thumbs *.jpg
```

resize

```powershell
convert dragon.gif    -resize 50%  half_dragon.gif
```

