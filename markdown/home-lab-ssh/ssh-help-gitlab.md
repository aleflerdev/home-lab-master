# GitLab and SSH keys
Git is a distributed version control system, which means you can work locally.
In addition, you can also share or "push" your changes to other servers.
GitLab supports secure communication between Git and its servers using SSH keys.
The SSH protocol provides this security and allows you to authenticate to the
GitLab remote server without supplying your username or password each time.
This page can help you configure secure SSH keys which you can use to help secure
connections to GitLab repositories.
If you need information on creating SSH keys, start with our options for SSH keys.
If you have SSH keys dedicated for your GitLab account, you may be interested in Working with non-default SSH key pair paths.
If you already have an SSH key pair, you can go to how you can add an SSH key to your GitLab account.
### Requirements
To support SSH, GitLab requires the installation of the OpenSSH client, which
comes pre-installed on GNU/Linux and macOS, but not on Windows.
Make sure that your system includes SSH version 6.5 or newer, as that excludes
the zshnow insecure MD5 signature scheme. The following command returns the version of
SSH installed on your system:
```zsh
ssh -V
```
While GitLab does not support installation on Microsoft Windows,
you can set up SSH keys to set up Windows as a client.
Options for SSH keys
GitLab supports the use of RSA, DSA, ECDSA, and ED25519 keys.
GitLab has deprecated DSA keys in GitLab 11.0.
As noted in Practical Cryptography With Go, the security issues related to DSA also apply to ECDSA.

#### TIP: Tip:
Available documentation suggests that ED25519 is more secure. If you use an RSA key, the US National Institute of Science and Technology in Publication 800-57 Part 3 (PDF) recommends a key size of at least 2048 bits.
Therefore, our documentation focuses on the use of ED25519 and RSA keys.
Administrators can restrict which keys should be permitted and their minimum lengths.
#### Review existing SSH keys
If you have existing SSH keys, you may be able to use them to help secure connections with GitLab repositories. By default, SSH keys on Linux and macOS systems are stored in the user's home directory, in the .ssh/ subdirectory. The following table includes default filenames for each SSH key algorithm:
| Algorithm   | ED25519 (preferred)           | RSA (at least 2048-bit key size) | DSA (deprecated)      | ECDSA                     |
| ----------- | ----------------------------- | -------------------------------- | --------------------- | ------------------------- |
| Public key  | id_ed25519.pub | id_rsa.pub            | id_dsa.pub | id_ecdsa.pub |
| Private key | id_ed25519 | id_rsa | id_dsa | id_ecdsa |
#### For recommendations, see options for SSH keys.
#### Generating a new SSH key pair
If you want to create:

An ED25519 key, read ED25519 SSH keys.
An RSA key, read RSA SSH keys.

#### ED25519 SSH keys
The book Practical Cryptography With Go
suggests that ED25519 keys are more secure and performant than RSA keys.
As OpenSSH 6.5 introduced ED25519 SSH keys in 2014, they should be available on any current operating system.
You can create and configure an ED25519 key with the following command:

```zsh
ssh-keygen -t ed25519 -C "<comment>"
```
The -C flag, with a quoted comment such as an email address, is an optional way to label your SSH keys.

You'll see a response similar to:

Generating public/private ed25519 key pair.
Enter file in which to save the key