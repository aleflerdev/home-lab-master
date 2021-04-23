## How to remove committed files from Git version control

1. Create a `.gitignore` file, if you haven’t already
2. Edit `.gitignore` to match the file/folder you want to ignore
3. Execute the following command: `git rm --cached path/to/file`. Git will list the files it has deleted. The `--cached` flag should be used if you want to keep the local copy but remove it from the repository.
4. Verify that these files are being deleted from version control using `git status`
5. Push the changes to the repository