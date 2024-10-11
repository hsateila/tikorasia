---
layout: post
title: 'Operating Systems: Installing a LAMP stack for WordPress'
date: 2024-09-20 11:16 +0300
categories: [Opintojaksot, Käyttöjärjestelmät ja palvelimet]
---
## Installing LAMP stack on Fedora

### What is a LAMP stack?

LAMP stack is a bundle of software that is one option of building a web server that can run WordPress web content management system for publishing and building web pages. The abbreviation consists of Linux, Apache HTTP server, MariaDB (Or MySQL) database software and PHP environment to run software built with PHP language. WordPress is built using PHP, as are many other web content management systems (CMS) such as Joomla, Drupal etc.

### Installation process preparations

Before you begin, you need either Ubuntu or Fedora virtual machine up and running, so set that up first along with the previous tutorials. Depending on whether you are working on VirtualBox or on VMWare Workstation/Fusion, you can make your life much easier by installing the VM tools to the guest operating systems. In case of Fedora, that means:

```bash
sudo dnf install open-vm-tools-desktop
```

Restart the VM so that tools will take effect and for example, copy/paste from and to the vm from and to host will work.

You'll be doing the whole installation process in the terminal, so fire that up. In both Ubuntu & Fedora, you'll find this under the name Terminal.

First you need to make sure both your repositories and utilities are up to date. Run this command, which will update your repository status:

Fedora: ```sudo dnf update```

Ubuntu: ```sudo apt update```

Note that the command will ask you for your user's password as you are asking to run this command with administrative privileges by using sudo. Give that, and note that when you write it, **cursor will not move and nothing will appear on the line as you write to hide your password**. This is by design when operating in Terminal.

Running the command it will ask you whether it is ok or not to download and install stuff, answer y & press enter to continue. You will get a list of updated packages and be back at the terminal prompt once the command finishes. If you get any errors, read them, analyze what went wrong (Google or AI advice if necessary) and fix, and try again.

### Installing Apache HTTP server

Apache HTTP Server is a free and open source HTTP server which is responsible of serving the web content from the server to the user client software, such as web browser. Apache is very widely used, but there are other options available, such as quite widely used Nginx, for example. Will install Apache with the following command:

Fedora: ```sudo dnf install httpd```

This istallation is quite straightforward, not giving you any prompts. Next, we will start the server software with the first command, and enable it with the second command. Enabling means that from that point on, the server software process, _httpd_, will be started always along with the operating system. So, when you shut down your VM and start it again, Apache HTTP server will start automatically every time.

First, start the server with this command:

Fedora: ```sudo systemctl start httpd````

It is possible the HTTP server does not start at this point, but produces an error something like this:

```text
Job for httpd.service failed because a timeout was exceeded.
See "systemctl status httpd.service" and "journalctl -xeu httpd.service" for details.
```

You can check the details of this error with the first command above:

```systemctl status httpd.service```

Note the row that states that "Referenced but unset environment variable evaluets to an empty string: OPTIONS". This is what it is all about, but it does not direct us where to fix it. However, in cases like this, first place to look for a configuration error or missing configuration is to look in HTTP server configuration file, which in Fedora resides in ```/etc/httpd/conf/httpd.conf````

We will edit this file, for example, with Nano text editor, and we'll need sudo to be able to save our changes. It is a good practice at this point to make a backup of the file so we can get back to start if needed. Below command will create a copy of the original config file in the same directory with the current file:

```bash
sudo cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf-bak
```

After the backup, open the file with sudo privileges using Nano editor:

```bash
sudo nano /etc/httpd/conf/httpd.conf
```

Look for a line that contains ```ServerName www.example:80``` or something similar. You can find it in Nano by pressling ctrl+W (Where is -command) and writing ServerName to the search prompt.

Once you find it, only thing to do here is to remove a comment hash (#) from the start of the line, so you have given some name for the server. Default value is fine for us, so only remove the hash and save the file by pressing ctrl+o (Write Out -command). Nano will confirm the filename you want to save on, so just press enter to overwrite the current file and save. Then quit nano by pressing ctrl+x.

Now try to start the httpd service (the web server application) with below command, and it should start without errors (it will not give you any notifications, just return to the command prompt).

Then, enable the server to boot automatically every time when operating system starts:

Fedora: ```sudo systemctl enable httpd```

You'll get a notification that symlink has been created.

Now you can test that the HTTP server actually is running. Fire up the browser within the virtual machine (Firefox, Chrome, Chromium) and write "localhost" on the address line. You should get the following page:

![Fedora test server page](./assets/media/fedora-http-server-page.png){: w="400"}

**That confirms that Apache HTTP server has been installed and working on Fedora. Congrats!** You can verify that server actually starts after reboot by rebooting the VM and then checking with a browser that localhost still opens the above page.

### Installing PHP

Next we will install PHP environment with some plugins so we are able to run Wordpress later on and connect to our database via phpmyadmin. You can do this by running following command:

```bash
sudo dnf -y install php php-cli php-php-gettext php-mbstring php-mcrypt php-mysqlnd php-pear php-curl php-gd php-xml php-bcmath php-zip php-fpm
```

Option ```-y``` will prevent dnf from asking installation confirmations. Then we'll install package php, which is the main PHP environment, and after that a bunch of plugins for PHP so all features of WordPress can be used.

Check the PHP version you have (it might not be exactly what is below, but 8 something in any case):

```bash
$ php -v
PHP 8.3.11 (cli) (built: Aug 27 2024 19:16:34) (NTS gcc aarch64)
Copyright (c) The PHP Group
Zend Engine v4.3.11, Copyright (c) Zend Technologies
    with Zend OPcache v8.3.11, Copyright (c), by Zend Technologies
```

#### PHP settings

PHP settings are located in a file called _php.ini_. In Fedora that can be found at ```/etc/php.ini```

Make a backup of this file as you did with httpd.conf above, and edit the file with sudo and Nano, and locate where you can change the timezone. **Hint: Look for "date.timezone"**. For compatible values you can use here, check [PHP documentation](https://www.php.net/manual/en/timezones.php). Remember to remove the semicolon (which acts as a comment character here) from the start of the line!

Once PHP is installed, you can move on to installing MariaDB.

### Installing & Securing MariaDB

We will begin the installation by installing the MariaDB server application. MariaDB is a fork from MySQL, and commonly used these days in LAMP setups instead of MySQL. Use the following command:

```bash
sudo dnf install mariadb-server
```

#### Basic config for MariaDB

MariaDB configuration file is located in ```/etc/my.cnf.d/mariadb-server.cnf```. Let's change the default character encoding there. Open the file again with sudo and Nano:

```bash
sudo nano /etc/my.cnf.d/mariadb-server.cnf
```

In the file, look for section ```[mysqld]``` and set the following value there. Note that you might _add_ the line here, as there might not be a value called character-set-server by default there at all. Just add it after the other lines, below section ```[mysqld]```.

```bash
character-set-server=utf8
```

After adding the line, save with ctrl+O and quit Nano with ctrl+X.

Now you'll need to start and enable the MariaDB server application the same way you did with httpd previously, like this.

First:

```bash
sudo systemctl start mariadb
```

And then enable it:

```bash
sudo systemctl enable mariadb
```

#### Securing the MariaDB installation

Next, we need to create the user and secure the installation. There is an installation script to do this, that comes with the MariaDB installation. This is, as a leftover, called ```mysql_secure_installation```. Run that, and you will get a series of questions. Default response (y) is fine for most questions, **but read them carefully so you know what you are doing**. Another thing is, once it asks you for the root user password (the main admin user for the database server with all the privileges), give the password of your choise there. It will not display anything (not even asterisks) when you write.

>**WRITE THAT PASSWORD DOWN SO YOU WILL REMEMBER IT!** Otherwise you need to do all things related to MariaDB installation all over again or some [magic stuff](https://www.digitalocean.com/community/tutorials/how-to-reset-your-mysql-or-mariadb-root-password).
{: .prompt-warning}

So, now that you have been warned, run the following command:

```bash
sudo mysql_secure_installation
```
First question you get is for the current password for root, and that's empty after installation so just press enter there.

Installation will go through like this.

- We are not using unix_socet authentication as our root account is protected in Fedora, so answer n
- We WILL cnage the root user password for MariaDB, so answer y here and give (and remember!) a password and rewrite it to confirm. Prompt will not show anything, not even asterisks, when you write the password.
- Remove anonymous users: y
- Disallow root login remotely: y (We definitely will prevent root access remotely!)
- Remove test database and access to it: y
- Reload privileges tables now? y (so that our new root password will take effect without rebooting the database server)

```bash
$ sudo mysql_secure_installation

NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL MariaDB
      SERVERS IN PRODUCTION USE!  PLEASE READ EACH STEP CAREFULLY!

In order to log into MariaDB to secure it, we'll need the current
password for the root user. If you've just installed MariaDB, and
haven't set the root password yet, you should just press enter here.

Enter current password for root (enter for none): 
OK, successfully used password, moving on...

Setting the root password or using the unix_socket ensures that nobody
can log into the MariaDB root user without the proper authorisation.

You already have your root account protected, so you can safely answer 'n'.

Switch to unix_socket authentication [Y/n] n
 ... skipping.

You already have your root account protected, so you can safely answer 'n'.

Change the root password? [Y/n] y
New password: 
Re-enter new password: 
Password updated successfully!
Reloading privilege tables..
 ... Success!


By default, a MariaDB installation has an anonymous user, allowing anyone
to log into MariaDB without having to have a user account created for
them.  This is intended only for testing, and to make the installation
go a bit smoother.  You should remove them before moving into a
production environment.

Remove anonymous users? [Y/n] y
 ... Success!

Normally, root should only be allowed to connect from 'localhost'.  This
ensures that someone cannot guess at the root password from the network.

Disallow root login remotely? [Y/n] y
 ... Success!

By default, MariaDB comes with a database named 'test' that anyone can
access.  This is also intended only for testing, and should be removed
before moving into a production environment.

Remove test database and access to it? [Y/n] y
 - Dropping test database...
 ... Success!
 - Removing privileges on test database...
 ... Success!

Reloading the privilege tables will ensure that all changes made so far
will take effect immediately.

Reload privilege tables now? [Y/n] y
 ... Success!

Cleaning up...

All done!  If you've completed all of the above steps, your MariaDB
installation should now be secure.

Thanks for using MariaDB!
```

Now you can test your database access on command prompt and give the root password you just created when requested (hope you remember that!):

```bash
$ mysql -u root -p
Enter password: 
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 11
Server version: 10.11.8-MariaDB MariaDB Server

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> 
```

That command will take you to MariaDB's own command prompt, where you can run SQL queries and admin the database from prompt directly. For now, we just check that you can access it. You can exit back to bash shell by giving the following command:

```sql
exit;
```
It will politely say "Bye" to you and you will be back in bash command prompt. **Congrats, MariaDB is now installed and operational!**

### Installing phpmyadmin

We will use phpmyadmin for a convenient graphic user interface for the database so we don't have to mess with manual SQL queries at this point.

As you might guess by this point, we will install it like this:

```bash
sudo dnf install phpmyadmin
```

Then we will restart Apache for the changes to take effect:

```bash
sudo systemctl restart httpd
```

And that's it! Now, on your virtual machine browser, go to the URL ```http://localhost/phpmyadmin/```. You should get the following page:

![phpmyadmin login screen](./assets/media/phpmyadmin-login-screen.png){: width="400"}

You can login from that screen using username "root" and the root password you created for MariaDB (I still hope you have it remembered!)

At this point, we have a complete LAMP setup ready and working to begin installing whatever PHP software we wish to install. We will just shortly install [Wordpress](https://wordpress.org/), the most popular Web Content Management System at the moment, which can, for example, be used for creating a portfolio if you wish.

### Installing Wordpress

There are excellent tutorials for this provided by Wordpress itself as well, but there'll be one here shortly as well, based directly on the LAMP server we just set up.
