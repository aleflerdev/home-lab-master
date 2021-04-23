# tar | gzip | bzip | zip - Info - Examples

All this info I found here at [wikibooks.org](https://en.wikibooks.org/wiki/Guide_to_Unix/Commands/File_Compression). Please give them money as they are the geniuses. 

|             |               |               |        |      |
| ----------- | ------------- | ------------- | ------ | ---- |
| [tar](#tar) | [gzip](#gzip) | [zip](#unzip) | [unzip](#gzip) |[bzip2](#bzip2)      |



### tar

**tar** archives without compression.

An archive contains one or more files or directories. (If archiving multiple files, it might be better to put them in one directory, so extracting will put the files into their own directory.)

| ![warning](https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Nuvola_apps_important_yellow.svg/40px-Nuvola_apps_important_yellow.svg.png) | Options to **tar** are confusing. Specify a mode every time. |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
|                                                              |                                                              |

Modes:

```bash
-c  create an archive (files to archive, archive from files)
-x  extract an archive (archive to files, files from archive)
-t  list an archive (lists the files in the archive)
```

Options:

```bash
-f FILE  name of archive - must specify unless using tape drive for archive
-v       be verbose, list all files being archived/extracted
-p       preserve permissions and (if possible) user/group when extracting.
-z       create/extract archive with gzip/gunzip
-j       create/extract archive with bzip2/bunzip2
-J       create/extract archive with XZ
```
*Examples:*

Compress (gzip) and package (tar) the directory `myfiles` to create `myfiles.tar.gz`:
```bash
$ tar -czvf aleflerdev.tar.gz aleflerdev.github.io
```
Uncompress (gzip) and unpack compressed package, extracting contents from `myfiles`:
```bash
$ tar -xzvf myfiles.tar.gz
```
There are two different conventions concerning gzipped tarballs. One often encounters .tar.gz. The other popular choice is .tgz. Slackware packages use the latter convention.

If you have access to a tape device or other backup medium, then you can use it instead of an archive file. If the material to be archived exceeds the capacity of the backup medium, the program will prompt the user to insert a new tape or diskette.

Use the following command to back up the `myfiles` directory to floppies:
```bash
$ tar -cvf /dev/fd0 myfiles
```
Restore that backup with:
```bash
$ tar -xvf /dev/fd0
```
You can also specify standard input or output `-f` instead of an archive file or device. It is possible to use copy between directories by piping two "tar" commands together. For example, suppose we have two directories, `from-stuff` and `to-stuff`
```bash
$ ls -F
from-stuff/
to-stuff/
```
As described in *Running Linux*, one can mirror everything from `from-stuff` to `to-stuff` this way:
```bash
$ tar cf - . | (cd ../to-stuff; tar xvf -)
```

Reference: Welsh, Matt, Matthias Kalle Dalheimer and Lar Kaufman (1999), *Running Linux.* Third edition, O'Reilly and Associates.

Links:

- [tar](http://pubs.opengroup.org/onlinepubs/7908799/xcu/tar.html), The Single ... Specification, Version 2, 1997, opengroup.org
- [C.4 Utilities](http://pubs.opengroup.org/onlinepubs/9699919799/xrat/V4_xcu_chap04.html), opengroup.org
- [tar man page](http://man.cat-v.org/unix_8th/1/tar), man.cat-v.org
- [GNU tar](https://www.gnu.org/software/tar/manual/tar.html), a manual, gnu.org



### gzip
[[edit](https://en.wikibooks.org/w/index.php?title=Guide_to_Unix/Commands/File_Compression&action=edit&section=1)]

**gzip** compresses files. Each single file is compressed into a single file. The compressed file consists of a GNU zip header and deflated data.

If given a file as an argument, gzip compresses the file, adds a ".gz" suffix, and deletes the original file. With no arguments, gzip compresses the standard input and writes the compressed file to standard output.

Some useful options are:

```bash
-c  Write compressed file to stdout. Do not delete original file.
-d  Act like gunzip.
-1  Performance: Use fast compression (somewhat bigger result)
-9  Performance: Use best compression (somewhat slower)
```

*Examples:*

Compress the file named `README`. Creates `README.gz` and deletes `README`.

```bash
$ gzip README
```

Compress the file called `README`. The standard output (which is the compressed file) is redirected by the shell to `gzips/README.gz`. Keeps `README`.

```bash
$ gzip -c README > gzips/README.gz
```

Use gzip without arguments to compress `README`.

```bash
$ < README gzip > gzips/README.gz
```

Links:

- [GNU Gzip](https://www.gnu.org/software/gzip/manual/gzip.html), a manual, gnu.org



### bzip2
[[edit](https://en.wikibooks.org/w/index.php?title=Guide_to_Unix/Commands/File_Compression&action=edit&section=8)] 

### [bzip2](https://www.freebsd.org/cgi/man.cgi?query=bzip2&apropos=0&sektion=1), freebsd.org

**bzip2** and **bunzip2** are similar to "gzip"/"gunzip" but with a different compression method. Compression is generally better but slower than "gzip". Decompression is somewhat fast.

An option of *-1* through *-9* can be used to specify how good **bzip2** should compress. The number tells how large "chunks" in steps of 100kB should compress at a time, so using **`bzip2 -5 foo.bar`** will compress foo.bar in chunks of 500kB each. Generally, larger chunks means better compression (but probably slower). Only *undamaged* "chunks" can be recovered with **`bzip2recover`** from a damaged bzip2-file, so if you've compressed 900kB chunks, you'll loose 900kB of your file if one chunk is damaged - but only 100kB if you used 100kB chunks (`bzip2 -1`). By default **bzip2** uses 900kB chunks for best possible compression.

**bzcat** is same as **`bunzip2 -c`** which is **`bzip2 -dc`**.

Links:

- [bzip2](https://www.freebsd.org/cgi/man.cgi?query=bzip2&apropos=0&sektion=1), freebsd.org



### zip
[[edit](https://en.wikibooks.org/w/index.php?title=Guide_to_Unix/Commands/File_Compression&action=edit&section=9)] 

### [zip](https://www.freebsd.org/cgi/man.cgi?query=zip&apropos=0&sektion=1), freebsd.org[Info-ZIP](https://en.wikipedia.org/wiki/Info-ZIP), wikipedia.org[Zip (file format)](https://en.wikipedia.org/wiki/Zip_(file_format)), wikipedia.org

Adds files to a compressed zip archive. You can extract files from a zip archive using [unzip](https://en.wikibooks.org/wiki/Guide_to_Unix/Commands/File_Compression#unzip). The zip format is a common archiving file format used on Microsoft Windows PCs. A zip archive has members compressed individually; imagine gzip of every file before tar-ing them, but with a different format.

Like for *gzip* the quality of the compression can be specified by giving a number between 1 and 9 as an option (e.g. *`zip -5`*). 1 is quickest, but gives a low-quality compression. 9 gives the highest quality of compression, but is slow. In addition 0 can be used (i.e. *`zip -0`*) to specify that the files should just be "stored" and *not* compressed (a compression of 0%), thus making it possible to use **zip** to make uncompressed archives.

Note that a *zip*-archive contains *individualy compressed* files collected into a single file. This is the opposite of how it's done for most other compressed *Unix*-archives (e.g. `tar.gz` and `tar.bz2`), where the files/directories are *first* collected into a single file -- an archive (e.g. *cpio* or *tar*), and *then* this *single file* is compressed (e.g. using *gzip* or *bzip2*).

Examples:

- zip archive.zip file.txt
  - Adds the file to the archive. If the archive does not exist, creates it.
- zip archive file.txt
  - As above; adds the .zip extension automatically, creating archive.zip.
- cat filelist.txt | zip archive.zip -@
  - Adds the files listed in filelist.txt to the archive.
- zip -0 archive.zip file.txt
  - Adds the file to the archive, making no compression, merely storing the file.
- zip archive.zip file1.txt file2.txt file3.txt
  - Adds multiple files to the archive.
- zip -r archive.zip .
  - Adds all files in the current directory and the sub-directories into the archive except for the archive itself, preserving the directory nesting information.
- zip -r -j archive.zip .
  - As above, but without the directory nesting information. Thus, each file is tracked under its file name only in the archive.
- zip -h2
  - Outputs extended help, longer than the -h one.

Links:

- [zip](https://www.freebsd.org/cgi/man.cgi?query=zip&apropos=0&sektion=1), freebsd.org

- [Info-ZIP](https://en.wikipedia.org/wiki/Info-ZIP), wikipedia.org

- [Zip (file format)](https://en.wikipedia.org/wiki/Zip_(file_format)), wikipedia.org

  

### unzip 
[[edit](https://en.wikibooks.org/w/index.php?title=Guide_to_Unix/Commands/File_Compression&action=edit&section=10)] 

- [unzip](https://www.freebsd.org/cgi/man.cgi?query=unzip&apropos=0&sektion=1), freebsd.org
- [infozip](https://sourceforge.net/projects/infozip/), sourceforge.net
- [unzip.c](https://github.com/freebsd/freebsd/blob/master/usr.bin/unzip/unzip.c) as part of FreeBSD, github.com

Extracts files from zip archives. See also [zip](https://en.wikibooks.org/wiki/Guide_to_Unix/Commands/File_Compression#zip). You can get a Windows version of Info-ZIP unzip from [GnuWin32](http://gnuwin32.sourceforge.net/packages/unzip.htm). FreeBSD appears to be using a custom version of unzip, distinct from Info-ZIP yet largely compatible with it.

Examples:

- unzip archive.zip
  - Extracts all files from the archive.
- unzip archive.zip file.txt
  - Extracts a particular file from the archive.
- unzip -l archive.zip
  - Lists files contained in the archive without extracting them.

Links:

- [unzip](https://www.freebsd.org/cgi/man.cgi?query=unzip&apropos=0&sektion=1), freebsd.org
- [infozip](https://sourceforge.net/projects/infozip/), sourceforge.net
- [unzip.c](https://github.com/freebsd/freebsd/blob/master/usr.bin/unzip/unzip.c) as part of FreeBSD, github.com