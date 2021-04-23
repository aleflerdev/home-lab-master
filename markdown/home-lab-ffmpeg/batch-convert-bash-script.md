# How to Batch Convert Music Files with FFMpeg



**Contents**

- - [1. Software Requirements and Conventions Used](# Software Requirements and Conventions Used)
  - [2. Set Up Your Variables](# Construct the Loop)
  - [3. Construct the Loop](# Construct the Loop)
  - [4. Strip Out the File Names](# Strip Out the File Names)
  - [5. Put it All Together, and Run](# Put it All Together, and Run)
  - [6. Conclusion](# Conclusion)

FFMpeg is at the core of tons of multimedia utilities, but the utility itself doesn't have the ability to convert multiple files at once. Thankfully, FFMpeg is scriptable, and you can easily set something up quickly with Bash.

**In this tutorial you will learn:**

- How to Set Up Your Variables
- How to Construct the Loop
- How to Strip Out the File Names
- How to Put it All Together, and Run

[![Batch Convert Audio Files With FFMPEG](https://linuxconfig.org/images/ffmpeg-batch-convert.jpg)](https://linuxconfig.org/images/ffmpeg-batch-convert.jpg)

Batch Convert Audio Files With FFMPEG.

## Software Requirements and Conventions Used

| Category    | Requirements, Conventions or Software Version Used           |
| :---------- | :----------------------------------------------------------- |
| System      | Any Distribution With FFMpeg                                 |
| Software    | FFMpeg                                                       |
| Other       | Privileged access to your Linux system as root or via the `sudo` command. |
| Conventions | **#** - requires given [linux commands](https://linuxconfig.org/linux-commands) to be executed with root privileges either directly as a root user or by use of `sudo` command **$** - requires given [linux commands](https://linuxconfig.org/linux-commands) to be executed as a regular non-privileged user |

1. ## Set Up Your Variables

   The only real way to handle batch file conversions with FFMpeg is through a [Bash script](https://linuxconfig.org/bash-scripting-tutorial-for-beginners). It doesn't need to be super complex or detailed, but you can, if you like that sord of thing, get really detailed with it. This guide is going to work with something much simpler that gets the job done.

   First, create a file for your script.

   ------

   ***SUBSCRIBE TO NEWSLETTER**
   Subscribe to Linux Career [NEWSLETTER](https://bit.ly/2X5D30q) and receive latest Linux news, jobs, career advice and tutorials.*

   ------

   ------

   ```bash
   touch ffmpeg-batch.sh
   ```

   Next, open it with your favorite text editor, and set it up as a bash script.

   ```bash
   #! /bin/bash
   ```

   This script is going to use a series of variables for file paths, extensions, and FFMpeg options. This way, it's flexible enough that you can pass it different files in different locations, choosing your file formats as you go.

   There are five variables that you'll need. You'll need one for each of the input directory and the output directory. Then, you'll need a set for the input file extension and another for the output extension. Finally, you can create one that's a general catch-all for your conversion options. Altogether, it should look something like this:

   ```bash
   srcExt=$1
   destExt=$2
   
   srcDir=$3
   destDir=$4
   
   opts=$5
   ```

   If you want to modify it, go right ahead. The extensions are necessary, rather than simply pulling them from the file because a folder may contain more than one type of file. If you'd rather assume that there's only one type of file in a folder, go right ahead and modify the script to work that way.

2. ## Construct the Loop

   Everything in this script happens through a simple `fore` loop. It will iterate over every file with the specified extension in the specified directory.

   ```bash
   for filename in "$srcDir"/*.$srcExt; do
   
   done
   ```

3. ## Strip Out the File Names

   To make the script truly adaptable, you're going to need to strip out the paths and extensions of each file to get the file name as it is. This way, the script will be able to export the newly converted files with identical names, eliminating the need for you to individually specify or rename files.

   First, strip off the extension and assign that to a new variable.

   ```bash
   for filename in "$srcDir"/*.$srcExt; do
   ```

   Then, strip the path off of the file name.

   ```bash
   baseName=${basePath##*/}
   ```

   You can try echoing out the result to see what you're getting. It should just be the file name itself.

   ```bash
   echo $baseName
   ```

4. ## Put it All Together, and Run

   You're finally ready to add in the real work from FFmpeg. This part is essentally just a simple call to FFMpeg, but working with your variables in place of literal file names. Give FFMpeg the full filename with the path as its input. Then, construct the output using the destination directory, the stripped down filename, and the destination file extension. Include your options in between. The quotes are necessary for Bash to treat each variable as a string.

   ```bash
   ffmpeg -i "$filename" $opts "$destDir"/"$baseName"."$destExt"
   ```

   You can add a message after the loop, confriming that the files were successfully converted. Altogether, your scrip should look something like this:

   ```bash
   #! /bin/bash
   
   srcExt=$1
   destExt=$2
   
   srcDir=$3
   destDir=$4
   
   opts=$5
   
   for filename in "$srcDir"/*.$srcExt; do
   
           basePath=${filename%.*}
           baseName=${basePath##*/}
   
           ffmpeg -i "$filename" $opts "$destDir"/"$baseName"."$destExt"
   
   done
   
   echo "Conversion from ${srcExt} to ${destExt} complete!"
   ```

   There isn't much to it, but the script is enough to handle most situations. Now, running it would look something like this:

   ```bash
   ./ffmpeg-batch.sh webm mp3 /home/aaron/Downloads/ /home/aaron/Downloads/out/ "-ab 192k"
   ```

## Conclusion

Once you get used to it, even something like this can be an extremely useful way to manage your audio, and even video, files. FFMpeg is an excellent tool, and if you'd prefer minimalism, you can get the same result as a bloated graphical program with a single line command.