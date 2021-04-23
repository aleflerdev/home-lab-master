# How to Use the SCP command to Transfer Files

Transferring files securely is paramount, when using a [VPS](https://www.hostinger.com/tutorials/what-is-vps-hosting). Luckily it can be done easily by using the SCP command. In this article, you’ll learn how to learn how to use SCP commands, and how they can work for you.

What are SCP commands precisely? Based on the Berkeley Software Distribution (BSD) Remote Copy Protocol (RCP), SCP (Secure Copy) is a network file transfer protocol that allows easy and secure file transfers between a remote and a local host, or two remote locations.

Full-stack developers frequently use an SCP command for its authentication and encryption features without requiring third-party hosting services like Github. It is an easy way to prevent exposing your data to packet sniffers, as well as preserve its confidentiality.

In essence, SCP is a mixture of RCP and [SSH](https://www.hostinger.com/tutorials/ssh/) (Secure Shell). It relies on the first to perform copy operations, and the second to encrypt the information and authenticate remote systems.

Unlike [Rsync](https://www.hostinger.com/tutorials/linux-rsync-remote-synchronization-command/), everything that you need to use the SCP command line successfully is a username and password or passphrase for the systems involved in the transfer. It streamlines the process since you don’t need to log into either of them.

- [SCP Command Example Syntax](https://www.hostinger.com/tutorials/using-scp-command-to-transfer-files/#SCP-Command-Example-Syntax)
- [Things to Look Out For](https://www.hostinger.com/tutorials/using-scp-command-to-transfer-files/#Things-to-Look-Out-For)
- Copying Files with the SCP Command
  - [Local File to a Remote Location](https://www.hostinger.com/tutorials/using-scp-command-to-transfer-files/#Local-File-to-a-Remote-Location)
  - [Remote File to Local Machine](https://www.hostinger.com/tutorials/using-scp-command-to-transfer-files/#Remote-File-to-Local-Machine)
  - [Remote File to Another Remote Location](https://www.hostinger.com/tutorials/using-scp-command-to-transfer-files/#Remote-File-to-Another-Remote-Location)

## SCP Command Example Syntax

The basic SCP command example looks like this:

```
scp [other options] [source username@IP]:/[directory and file name] [destination username@IP]:/[destination directory]
```

It might seem complicated at first, but we’ll happily break it down!

In this example we’re performing a transfer between two VPS servers.

- **[other options]** are modifiers you can add to the SCP command. We’ll cover the most popular ones later
- **[source username@IP]** is the username and IP of the machine that has the file you want. It would look something like root@123.123.123.12
- **:/** informs the SCP command that you’re about to type in the source directory
- **[directory and file name]** is where the file is located, and the name of it. It looks like /users/Edward/Desktop/SCP.png
- **[destination username@IP]** is the username and IP of the destination machine
- **[destination directory]** lastly, is the destination directory where the file will be saved

In a real world scenario it would look like this:

```
scp -p root@162.168.1.1:/media/scp.png edward@162.168.1.2:/desktop/destination
```

See, it’s pretty simple! If you’re copying to, or from a local machine, you won’t need the IP address, the destination or source path like /desktop/folder_name.

Let’s talk about other options you can use to modify the SCP command. There are 20 common ones that you can use both in single character form (-o), as well as their descriptive equivalent (–option). Commonly used options are:

- –P port makes it possible to specify a different entry to the server (the default port for TCP port for the command is 22)
- –c cipher gives you the possibility to specify the encryption algorithm that the client will use. Some of the values you can use are ‘aes256-ctr’, ‘aes256-cbc’, ‘blowfish-cbc’, ‘arcfour’, ‘arcfour128’, ‘arcfour256’, ‘cast128-cbc’, aes128-ctr’, ‘aes128-cbc’, ‘aes192-ctr’, ‘aes192-cbc’, and 3des-cbc’. The default option in the shell configuration is ‘AnyStdCipher’
- –q will run the operation in quiet mode, which means that only critical errors will be displayed.
- –r is for recursive copying, which will include all subdirectories.
- -4 or -6 can be used if you want to choose the protocol version employed, either IPv4 or IPv6. You can also configure IP address requirements more exhaustively with the address-family keyword.
- –p will preserve the initial modification times and attributes of the file.
- –u will delete the source file after the transfer is complete.
- –c will enable compression of the data while the transfer operation takes place.

## Things to Look Out For

Since SCP uses SSH encryption, you will need the ssh password for the file transfer to happen. Moreover, it is necessary to have read permission on the machine you’re about to copy from and write privileges on the machine(s) you’ll copy to.

For the connection authentication and configuration, you will have to generate an ssh key pair in the terminal by using the following command:

```
ssh-keygen -t rsa
```

You copy this key to the remote system using:

```
ssh-copy-id user@remote_machine
```

Once you’ve authenticated on the remote machine(s), the public key will be copied and you’re ready to start the transfers.

If you do not remember the root password(s) for either system, you can have the ssh client select the file from which the private identity key for RSA confirmation is read automatically.

For protocol version 2, the default identity path of the host key is **~/.ssh/id_dsa**, while for protocol version 1 it is **~/.ssh/id_rsa**. Then, you must find out where the back-up for the private and public keys are stored so you can employ the ssh command to automatically use them.

For the **/back-up/home/jack/.ssh** path the command is as follows:

```
ssh -i /back-up/home/user/.ssh/id_dsa user@yourserver.servername.domain
```

**Pro tip:** this option has the default value **–overwrite [yes]**, so unless you specify the **–overwrite no** or **–overwrite ask** option in your scp command, the operation will overwrite those files that have identical names and locations without any warning.

If you’re transferring large files we recommend using a tmux session or running the command inside a different screen. Moreover, you should also use the option –v for big transfers. It will force scp to display any debugging connections, authentication, or configuration problems.

## Copying Files with the SCP Command

The best part about SCP is that it gives you the possibility to transfer files between two hosts, or between a host and a local machine. Let’s see how the command should be used for each type of transfer.

### Local File to a Remote Location

We’ll copy a local file **scp.zip**, to the user of the remote machine called **root**. The username is followed by the server’s IP address.

Example:

```
scp /users/Edward/desktop/scp.zip root@191.162.0.2:/writing/article
```

If you do not have an automatic ssh client confirmation set up, you will be prompted to enter the password from the remote machine’s user and will see a progress meter. It would look something like this:

```
root@191.162.0.2’s password:
novel3.zip   100% 0 0.0KB/s 00:00
```

But let’s say that the remote machine is set to listen for SSH connections on a port other than the default 22. In this case, you must specify that port using an option.

```
scp -P 2322 /users/Edward/desktop/scp.zip root@191.162.0.2:/writing/article
```

If you also want to change the name of the file during the transfer operation, then your command will look like this (if your port is not the default one, just add **–P** and the port number):

```
scp /users/Edward/desktop/scp.zip root@191.162.0.2:/writing/article/howtoscp.zip
```

If you want to copy a directory that has more files and/or subdirectories, use the –**r** command line we described earlier

```
scp -r /users/Edward/desktop root@191.162.0.2:/writing/article
```

### Remote File to Local Machine

In this process, the source and target of the command are reversed, so this must be reflected in your syntax. This time, we are trying to copy **scp.zip** from the same remote host to our local machine:

```
scp root@191.162.0.2:/writing/articles/SCP.zip Users/Edward/Desktop
```

Again, this should prompt the same SSH login output where you have to input the password unless authentication was disabled by sudo privileges, or you forced the ssh client to use a private key on your machine.

### Remote File to Another Remote Location

In order to copy files from one remote host to another, you will have to enter the passwords for both accounts after you run this command in your terminal.

Example:

```
scp root@191.162.0.2:/writing/article/scp.zip edward@11.10.0.1:/publishing
```

The command above copies the source file **/writing/article/scp.zip** from the first host to the second one. To copy folders, just add the **–r** option and specify the folder path instead of the file inside of it, like we did before.

Under normal circumstances, the file goes straight from the first remote host to the second. However, if you want to reroute the operation through your machine, you can add the **-3** option:

```
scp -3 root@191.162.0.2:/writing/article/scp.zip edward@11.10.0.1:/publishing
```

That’s it, all there is to it!

## Wrapping up

In this article, we’ve learned how to easily transfer files between remote and local hosts with the scp command. This is extremely useful when you’re working with multiple servers. The secure copy protocol makes it easier to successfully copy information from one remote host to another without having to log in.

Furthermore, this method of remote file transfer encrypts your data with secure shell, which will ensure the confidentiality of the information that is being transmitted.