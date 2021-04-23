# Redirect my cPanel website to HTTPS

After your [SSL certficate is installed](https://ca.godaddy.com/help/manually-install-an-ssl-certificate-on-my-cpanel-hosting-12027) on your Linux Hosting account, there are some modifications you'll need to make to your `.htaccess` file.  Adding a few lines to your `.htaccess` file will automatically redirect your visitors to the HTTPS version of your website.

 **Note:** These instructions *don't* apply to WordPress installed on cPanel. For those steps, see [Redirect my WordPress website to HTTPS for Linux Hosting](https://ca.godaddy.com/help/redirect-my-wordpress-website-to-https-for-linux-hosting-27871)

1. Go to your GoDaddy  [product page](https://account.godaddy.com/products/).

2. Under **Web Hosting**, next to the Linux Hosting account you want to use, click **Manage**.
    ![click manage](https://img4.wsimg.com/support/images/hosting/reuse/hosting-cpanel-click-manage-092719.png)

3. In the account **Dashboard**, click **File Manager**.
   ![select file manager](https://img4.wsimg.com/support/images/hosting/reuse/hosting-cpanel-select-file-manager-080519.png)

4. In the cPanel File Manager, click **Settings**.

5. Make sure that **Show Hidden Files (dotfiles)** is checked, and click **Save**.

6. Click on *public_html*, and open your `.htaccess` if you already have one. If not, click **File+**, name the file `.htaccess` and click **Create New File**.

7. Select the 

   ```
   .htaccess
   ```

    file, and click 

   Edit

   . 

   - If you just created your 

     ```
     .htaccess
     ```

      file, use the following code to set up the URL redirect to the HTTPS version of your website: 

     ```
     RewriteEngine On 
     RewriteCond %{SERVER_PORT} 80
     RewriteCond %{HTTP_HOST} ^(www\.)?coolexample\.com
     RewriteRule ^(.*)$ https://www.coolexample.com/$1 [R,L]
     ```

   - If your `.htaccess` file already exists in your hosting account, do not duplicate `ReWriteEngine On`. Insert the lines that begin with `ReWriteCond` and `RewriteRule` directly after the already existing `ReWriteEngine On`.

   - **Required:**  You need to replace *coolexample.com* with your domain name for the sample code to work. 		

8. Click **Save Changes** and **Close.** That's it!

Visit your website and you'll  automatically be re-directed to the HTTPS version.

We provide these instructions as a courtesy, but you may need to make other changes to get the redirect working if you already have a `.htaccess` file.