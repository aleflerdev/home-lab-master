# [How to Use 7Zip to Create Multiple Compressed Folders in One Go](https://www.wikihow.com/Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go)



## Steps

1. 

   [![Image titled Use 7Zip to Create Multiple Compressed Folders in One Go Step 1](https://www.wikihow.com/images/thumb/9/94/Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-1.jpg/aid1229562-v4-728px-Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-1.jpg.webp)](https://www.wikihow.com/Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go#/Image:Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-1.jpg)

   1

   **Install 7zip.** If you let it install in its default setting it should typically be in "C:\Program Files\7-zip\7z.exe."

   

2. 

   [![Image titled Use 7Zip to Create Multiple Compressed Folders in One Go Step 2](https://www.wikihow.com/images/thumb/b/bc/Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-2.jpg/aid1229562-v4-728px-Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-2.jpg.webp)](https://www.wikihow.com/Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go#/Image:Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-2.jpg)

   2

   **Fire up Notepad.** You won't need to use 7zip's graphical user interface, so no need to run it after installing.

   

3. 

   [![Image titled Use 7Zip to Create Multiple Compressed Folders in One Go Step 3](https://www.wikihow.com/images/thumb/d/d2/Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-3.jpg/aid1229562-v4-728px-Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-3.jpg.webp)](https://www.wikihow.com/Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go#/Image:Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-3.jpg)

   3

   **In Notepad, insert this single line of code:** `for /d %%X in (*) do "c:\Program Files\7-Zip\7z.exe" a "%%X.7z" "%%X\"`

   

4. 

   4

   ***\*Note:\** If you'd like to output to .ZIP files, change the "`%%X.7z`" to "`%%X.zip`"**

   [![Image titled Use 7Zip to Create Multiple Compressed Folders in One Go Step 4](https://www.wikihow.com/images/c/ca/Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-4.jpg)](https://www.wikihow.com/Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go#/Image:Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-4.jpg)

   

5. 

   5

   **Click 'File' then 'Save As'.**

   [![Image titled Use 7Zip to Create Multiple Compressed Folders in One Go Step 5](https://www.wikihow.com/images/a/a3/Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-5.jpg)](https://www.wikihow.com/Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go#/Image:Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-5.jpg)

   

6. 

   [![Image titled Use 7Zip to Create Multiple Compressed Folders in One Go Step 6](https://www.wikihow.com/images/thumb/3/32/Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-6.jpg/aid1229562-v4-728px-Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-6.jpg.webp)](https://www.wikihow.com/Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go#/Image:Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-6.jpg)

   6

   **Browse to the location of the folders you want to compress.** In our example it is in C:\My Music.

   

7. 

   7

   **Create your very own batch file by setting 'Save as type' to 'All files' and naming it something like 'foldertomultiple7z.bat'.** Take note of the file extension, which is .bat. Be sure not to set the file type as 'Text Documents' too.

   [![Image titled Use 7Zip to Create Multiple Compressed Folders in One Go Step 7](https://www.wikihow.com/images/0/0c/Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-7.jpg)](https://www.wikihow.com/Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go#/Image:Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-7.jpg)

   

8. 

   [![Image titled Use 7Zip to Create Multiple Compressed Folders in One Go Step 8](https://www.wikihow.com/images/thumb/3/3e/Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-8.jpg/aid1229562-v4-728px-Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-8.jpg.webp)](https://www.wikihow.com/Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go#/Image:Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-8.jpg)

   8

   **Click Save.**

   

9. 

   [![Image titled Use 7Zip to Create Multiple Compressed Folders in One Go Step 9](https://www.wikihow.com/images/thumb/6/64/Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-9.jpg/aid1229562-v4-728px-Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-9.jpg.webp)](https://www.wikihow.com/Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go#/Image:Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-9.jpg)

   9

   **Close Notepad and navigate to your 'My Music' folder.** Notice that the batch file is at the same directory level as the folders that need to be compressed.

   

10. 

    10

    **Run the batch file by double-clicking on your bat file within your 'My Music' folder.** DO NOT run as Administrator (option appears in right-click menu) - running as Administrator will compress the files in windows/system32. After you double-click on the bat file, the windows command prompt appears and 7zip begins to do its thing.

    

    - The windows command prompt disappears when all compressed folders are created. You should now see them inside your folder.

      [![Image titled Use 7Zip to Create Multiple Compressed Folders in One Go Step 10Bullet1](https://www.wikihow.com/images/thumb/0/0e/Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-10Bullet1.jpg/aid1229562-v4-728px-Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-10Bullet1.jpg.webp)](https://www.wikihow.com/Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go#/Image:Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-10Bullet1.jpg)

    

11. 

    [![Image titled Use 7Zip to Create Multiple Compressed Folders in One Go Step 11](https://www.wikihow.com/images/thumb/e/e3/Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-11.jpg/aid1229562-v4-728px-Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-11.jpg.webp)](https://www.wikihow.com/Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go#/Image:Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-11.jpg)

    11

    **Verify the validity of your compressed folders.** To do this, highlight them all and click the right mouse button. If you installed 7zip in its default setting, you'll have its menu incorporated in the Windows shell. Navigate to it and click 'Test Archive.'

    - 7zip should report that there are no errors in your archive.

      [![Image titled Use 7Zip to Create Multiple Compressed Folders in One Go Step 11Bullet1](https://www.wikihow.com/images/thumb/5/55/Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-11Bullet1.jpg/aid1229562-v4-564px-Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-11Bullet1.jpg.webp)](https://www.wikihow.com/Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go#/Image:Use-7Zip-to-Create-Multiple-Compressed-Folders-in-One-Go-Step-11Bullet1.jpg)

    - You are done creating multiple compressed folders in one go using 7zip. You can now move them to the external hard drive. You can delete the batch file you created or move it to a different folder.