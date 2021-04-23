# Batch Script

###### Script to convert a list of files using ffmpeg and powershell. This example converts to .ogv files (theora/vorbis as video/audio codecs)

###### Please note that, if you haven't done so, you should set the execution policy of powershell in order to be able to run this script.

###### The easiest way to run this script without messing to much with execution policies is to set it for a single powershell session:

```powershell
 powershell.exe -ExecutionPolicy Unrestricted
```
#### [Check:](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies)

```bash
$filenames = "1","2", "3", "4", "5","6","7"
$filepath = "C:\Users\Oculus\Documents\Videos\Menu\"
$extension = ".mp4"
```
```bash
ForEach( $file in $filenames){
#Convert using ffmpeg
ffmpeg -i $filepath$filename$extension -codec:v libtheora -qscale:v 7 -codec:a libvorbis -qscale:a 5 $filepath$file.webm
}
```