# Youtube-dl Tutorial With Examples For Beginners

**Youtube-dl** is a most popular command line YouTube downloader application. It is not just to download videos from Youtube, but also from a lot of other websites. You can view the complete list of supported sites [**here**](https://ytdl-org.github.io/youtube-dl/supportedsites.html). Youtube-dl can be able to download a single track or entire playlist in one go. It is a free and open source program written in **Python**. It supports GNU/Linux, Mac OS X and Microsoft Windows. In this detailed Youtube-dl tutorial, we will learn to use most commonly used commands with examples to download audio and video streams from online in Linux.

### Install Youtube-dl For Windows Here
[Download youitube-dl.exe here.](https://youtube-dl.org/downloads/latest/youtube-dl.exe)

### Install Youtube-dl On Linux

Youtube-dl can be installed in many ways.

##### The officially recommended way

The officially recommended way to install Youtube-dl is just download it, save it in your PATH, make it executable and start using it right away.

```
$ sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
```

If you don’t have curl, use **wget** instead:

```
$ sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
$ sudo chmod a+rx /usr/local/bin/youtube-dl
```

##### Install Youtube-dl using Pip

Alternatively, you can install it using [**Pip**](https://www.ostechnix.com/manage-python-packages-using-pip/) as shown below.

```
$ sudo -H pip install --upgrade youtube-dl
```

#### Install Youtube-dl using package manager

Youtube-dl is also available in the official repositories of some Linux distributions. For example, you can install it in Arch Linux using command:

```
$ sudo pacman -S youtube-dl
```

On Debian, Ubuntu, Linux mint:

```
$ sudo apt install youtube-dl
```

On Fedora:

```
$ sudo dnf install youtube-dl
```

#### Install FFmpeg on Linux

Youtube-dl depends on **FFmpeg** to download 720p videos from YouTube and convert videos to other formats. To install FFmpeg on Linux, refer the following guide.

- [**How to install FFmpeg on Linux**](https://www.ostechnix.com/install-ffmpeg-linux/)

  ### Update Youtube-dl

If you’ve manually installed Youtube-dl using curl or wget, run the following command to update it:

```
$ sudo youtube-dl -U
```

If you installed it using pip, do:

```
$ sudo pip install -U youtube-dl
```

Those who installed Youtube-dl using the distribution’s package manager, just use the appropriate update command. For example, on Arch Linux, you can update Youtube-dl by simply running the following command:

```
$ sudo pacman -Syu
```

On Debian, Ubuntu:

```
$ sudo apt update
```

Now, let us see some examples to learn to use Youtube-dl.

## Youtube-dl Tutorial With Examples

Here, I have compiled most commonly used Youtube-dl commands to download a video or playlist from YouTube.

#### 1. Download video or playlist

To download a video or the entire playlist from YouTube, just mention the URL like below:

```
$ youtube-dl https://www.youtube.com/watch?v=7E-cwdnsiow
```

If you want to download video or playlist with a custom name of your choice, the command would be:

```
$ youtube-dl -o 'abdul kalam inspirational speech' https://www.youtube.com/watch?v=7E-cwdnsiow
```

Replace “abdul kalam inspirational speech” with your own name.

Do you want to save the video in some other location? Here you go!

```
$ youtube-dl -o '~/Downloads/abdul kalam speech' https://www.youtube.com/watch?v=7E-cwdnsiow
```

Here I am downloading the video to the **Downloads** directory.

```
[youtube] 7E-cwdnsiow: Downloading webpage
[download] Destination: /home/sk/Downloads/abdul kalam speech.f271
[download] 100% of 111.86MiB in 01:00
[download] Destination: /home/sk/Downloads/abdul kalam speech.f251
[download] 100% of 6.12MiB in 00:03
[ffmpeg] Merging formats into "/home/sk/Downloads/abdul kalam speech.webm"
Deleting original file /home/sk/Downloads/abdul kalam speech.f271 (pass -k to keep)
Deleting original file /home/sk/Downloads/abdul kalam speech.f251 (pass -k to keep)
```

You can also include additional details, such as the title, the uploader name (channel name) and upload date etc., in the file name by using the following command:

```
$ youtube-dl -o '%(title)s by %(uploader)s on %(upload_date)s in %(playlist)s.%(ext)s' https://www.youtube.com/watch?v=7E-cwdnsiow
```

#### 2. Download multiple videos

Sometimes, you might want to download multiple videos from or any other site. If so, just mention the URL of the videos with space-separated like below:

```
$ youtube-dl <url1> <url2>
```

Alternatively, you can put them all in a text file and pass it to Youtube-dl as an argument like below.

```
$ youtube-dl -a url.txt
```

This command will download all videos mentioned in the url.txt file.

#### 3. Download audio-only from a video

Youtube-dl allows us to download audio only from a YouTube video. If you ever been in a situation to download only the audio, run:

```
$ youtube-dl -x https://www.youtube.com/watch?v=7E-cwdnsiow
```

By default, Youtube-dl will save the audio in **Ogg** (opus) format.

If you prefer to download any other formats, for example **mp3**, run:

```bash
$ youtube-dl -x --audio-format mp3 https://www.youtube.com/watch?v=7E-cwdnsiow
```
#### I have found the code below works without issue for playlists and the one above does not.
```powershell
##### NOTICE THE DOUBLE QUOTES #####

youtube-dl -i --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" "youtubeurlhere"
```
This command will download the audio from the given video/playlist, convert it to an MP3 and save it in the current directory. Please note that you should install either **ffmpeg** or **avconv** to convert the file to mp3 format.
