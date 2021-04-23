### [Learn tree Command Usage Examples](https://www.tecmint.com/linux-tree-command-examples/)

```bash
# yum install tree	 #RHEL/CentOS 7
# dnf install tree	 #Fedora 22+ and /RHEL/CentOS 8
$ sudo apt install tree	 #Ubuntu/Debian
# sudo zypper in tree 	 #openSUSE
```

Once installed, you can proceed further to learn the tree command usage with examples as shown below.

Invoke sudo to run the tree in a directory that requires root user access permissions.

```bash
# tree
OR
$ sudo tree
```

You can enable the printing of hidden files using the `-a` flag.

```
$ sudo tree -a
```

To list the directory contents with the full path prefix for each sub-directory and file, use the `-f` as shown.

```
$ sudo tree -f
```

You can also instruct tree to only print the subdirectories minus the files in them using the `-d` option. If used together with the `-f` option, the tree will print the full directory path.

```
$ sudo tree -d 
OR
$ sudo tree -df
```

You can specify the maximum display depth of the directory tree using the `-L` option. For example, if you want a depth of **2**, run the following command.

```
$ sudo tree -f -L 2
```

Directory Listing Depth

Here is another example about setting maximum display depth of the directory tree to **3**.

```
$ sudo tree -f -L 3
```

To display only those files that match the wild-card pattern, use the `-P` flag and specify your pattern. In this example, the command will only list files that match `somefile*`, so files such as **somefile.sh**, **somefile.bat**

```
$ sudo tree -f -P cata*
```

You can also tell the **tree** to prune empty directories from the output by adding the `--prune` option, as shown.

```
$ sudo tree -f --prune
```

There are also some useful file options supported by tree such as `-p` which prints the file type and permissions for each file in a similar way as the [ls -l command](https://www.tecmint.com/tag/linux-ls-command/).

```
$ sudo tree -f -p 
```

Besides, to print the **username** (or **UID** if no username is available), of each file, use the `-u` option, and the `-g` option prints the group name (or **GID** if no group name is available). You can combine the `-p`, `-u` and `-g` options to do a long listing similar to [ls -l command](https://www.tecmint.com/tag/linux-ls-command/).

```
$ sudo tree -f -pug
```

You can also print the size of each file in bytes along with the name using the `-s` option. To print the size of each file but in a more human-readable format, use the `-h` flag and specify a size letter for kilobytes (K), megabytes (M), gigabytes (G), terabytes (T), etc..

```
$ sudo tree -f -s
OR
$ sudo tree -f -h
```

To display the date of the last modification time for each sub-directory or file, use the `-D` options as follows.

```
$ sudo tree -f -pug -h -D
```

Another useful option is `--du`, which reports the size of each sub-directory as the accumulation of sizes of all its files and subdirectories (and their files, and so on).

```
$ sudo tree -f --du
```

**12.** Last but not least, you can send or redirect the tree’s output to filename for later analysis using the `-o` option.

```
$ sudo tree -o direc_tree.txt
```

That’s all with the **tree command**, run **man tree** to know more usage and options. If you have any questions or thoughts to share, use the feedback form below to reach us.