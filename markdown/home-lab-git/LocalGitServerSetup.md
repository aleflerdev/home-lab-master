# Local Git Server for Personal Backup

1. Download Git (which will install git bash -  you will need this).
[git-srm.com/donwloads](https://git-scm.com/downloads)

2. Create a folder for you "local Git repository"

  ex. `C:\Users\Public\Git Server`

```bash
git init LocalGitServer.git --bare
```

Wunderbar! Done. You now have your server.

3. Navigate using explorer (via git bash) to the folder that you would like to initialize your client repository and right click to open git bash in that folder.

4. 
**NOTE** Don't which way your slashes (\) (/) are facing for navigation.

5. Use the folling command to clone the repository you made in step two.

   
```bash
git clone C:/Users/Public/Git_Server
```



![bashCommand](E:\home-lab-master\markdown\home-lab-git\pics\bashCommand.png)



Great. You can not push your work to you your local/remote server.
But wait...

5. If you want to share with others locally go to Control Panel > Network And Sharing Center > Change advanced sharing settings

Turn on network discovery if it's not already on.![ntwrkDiscovery](E:\home-lab-master\markdown\home-lab-git\pics\ntwrkDiscovery.png)

- Right click on your local git server folder you created and share that folder with others on your network. If its just you. Skip step 5.
6.  Send link to the others if you so desire.