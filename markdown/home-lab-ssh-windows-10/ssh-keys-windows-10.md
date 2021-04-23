### Generate an SSH key in Windows 10 with OpenSSH Client

### Step 1: Verify if OpenSSH Client is Installed

First, check to see if you have the OpenSSH client installed:

1. Open the **Settings** panel, then click **Apps**.

2. Under the *Apps and Features* heading, click **Optional Features**.

![screenshot of Windows Optional Features](E:\home-lab\home-lab-ssh-windows-10\ssh-keys-windows-10.assets\windows-apps.png)

3. Scroll down the list to see if **OpenSSH Client** is listed.

- - - If it’s not, click the plus-sign next to **Add a feature**.
    - Scroll through the list to find and select **OpenSSH Client**.
    - Finally, click **Install**.

![How to find OpenSSH Client in the Windows optional features list](E:\home-lab\home-lab-ssh-windows-10\ssh-keys-windows-10.assets\optional-windows-features.png)

### Step 2: Open Command Prompt

1. Press the **Windows key**.

2. Type ***cmd***.

3. Under *Best Match*, right-click **Command Prompt**.

4. Click **Run as Administrator**.

![Image of how to run the Windows Command Prompt as an Admin user.](E:\home-lab\home-lab-ssh-windows-10\ssh-keys-windows-10.assets\run-command-prompt-as-admin.png)

5. If prompted, click **Yes** in the *Do you want to allow this app to make changes to your device?* pop-up.

### Step 3: Use OpenSSH to Generate an SSH Key Pair

1. In the command prompt, type the following:

```output
ssh-keygen
```

2. By default, the system will save the keys to **C:Users*your_username*.sshid_rsa**. You can use the default name, or you can choose more descriptive names. This can help distinguish between keys, if you are using multiple key pairs. To stick to the default option, press **Enter**.
![OpenSSH command tgenerates an SSH key in Windows](E:\home-lab\home-lab-ssh-windows-10\ssh-keys-windows-10.assets\generate-ssh-key-in-windows-command-prompt.png)

**Note:** If a file with the same name already exists, you will be asked whether you want to overwrite the file.

3. You’ll be asked to **enter a passphrase.** Hit **Enter** to skip this step.

4. The system will generate the key pair, and display the **key fingerprint** and a **randomart image**.

5. Open your file browser.

6. Navigate to **C:Users*your_username*.ssh**.

7. You should see two files. The identification is saved in the **id_rsa** file and the public key is labeled **id_rsa****.pub**. This is your SSH key pair.

![SSH key pair and randomart image generated with the SSH keys on Windows 10.](E:\home-lab\home-lab-ssh-windows-10\ssh-keys-windows-10.assets\ssh-key-randomart-image.png)

**Note**: Normally, the public key is identified with the **.pub** extension. You can use **Notepad** to see the contents of both the private and public key.

## Generate SSH Keys Using PuTTY

Before OpenSSH was included with Windows, the PuTTY tool was the gold standard for generating SSH keys.

### Step 1: Install PuTTY

1. Browse to the developer’s page, and download the installer for PuTTY:

- https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html

2. Double-click the downloaded file and follow the installation wizard to finish the installation.

- On the initial dialog of the installation wizard, click **Next**.

- Select the **destination folder**. Use the default installation configuration unless you have a specific need to change it. Click **Next** to move on to the next screen.

![Select destination folder for the PuTTY installation](E:\home-lab\home-lab-ssh-windows-10\ssh-keys-windows-10.assets\install-wizard-putty.png)

- Select PuTTY **product features** to be installed. Stick to the defaults if you do not have any specific needs. Click **Next** to move on to the next screen.

![Putty product features selected](E:\home-lab\home-lab-ssh-windows-10\ssh-keys-windows-10.assets\select-product-features-putty.png)

- Once the process completes, click **Finish** to exit the installation wizard.

### Step 2: Run the PuTTY SSH Key Generator

1. Press the **Windows key**.

2. Type ***puttygen*.**

3. Under *Best Match*, right-click **PuTTYgen**.

4. Click **Run as administrator.**

5. If prompted, click **Yes** on the *Do you want to allow this app to make changes to your device?* pop-up.

### Step 3: Use PuTTY to Create a Pair of SSH Keys

The process outlined below will generate **RSA** keys, a classic and widely-used type of encryption algorithm. The **PuTTY keygen** tool offers several other algorithms – DSA, ECDSA, Ed25519, and SSH-1 (RSA).

If you require a different encryption algorithm, select the desired option under the *Parameters* heading before generating the key pair.

1. In the *PuTTY Key Generator* window, click **Generate**.

2. Move the cursor around in the gray box to fill up the green bar.

![Generating an SSH key pair in Putty.](E:\home-lab\home-lab-ssh-windows-10\ssh-keys-windows-10.assets\generating-ssh-key-with-putty.png)

3. Save the public key:

- Click the button labeled **Save public key**.

- Choose a location to save the key.
- Give the key a name (e.g., **putty_key.pub**)

![Editing advanced SSH keys options in PuTTY.](E:\home-lab\home-lab-ssh-windows-10\ssh-keys-windows-10.assets\putty-ssh-keys-advanced-options.png)

4. Save the **private key**:

- Click the **Conversions** menu at the top.

- Click **Export OpenSSH key**.
- You’ll be asked if you want to save a key without a passphrase. Click **Yes**.
- Choose a location to save the key (usually the same folder as the public key).
- Give the key a name (e.g., **putty_key**).

## Using Your SSH Keys

To use your SSH keys, copy your **public SSH key** to the system you want to connect to. Use your **private SSH key** on your own system. Your private key will match up with the public key, and grant access.