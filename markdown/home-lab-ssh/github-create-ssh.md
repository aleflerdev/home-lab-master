### Github ssh-keygen recomendations for adding your local key pair to the github - settings - ssh area.

[Github official page here](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

#### Create the pair of keys for GitHub
```bash
ssh-keygen -t rsa -b 4096 -C "aleflerdev@outlook.com"
```
#### Start the ssh-agent in background.
```bash
eval $(ssh-agent -s)
```
#### Add the key to ssh-agent using the command below.
```bash
ssh-add ~/.ssh/id_rsa
```
#### If you don't have nano like I did at the time you can you **cat** command.
```bash
cat ~/.ssh/id_rsa.pub
```
