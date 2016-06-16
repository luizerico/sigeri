SIGERI
=======================

Introduction
------------
This is the beta version of a system to risk management - SIGERI.  
This application is meant to be used as a starting point to develop a complete 
risk management system.

There is a lot of changes to be done before to put it in a production environment:
    
    a. Correct translations - I have started the changes on templates to make it works with .po files. Due to this some parts are in english and others in portuguese. 
    b. Make some things more responsive - I have started another project using React. Maybe I would rewrite the templates here... or not.
    c. Build printable reports.
    d. Rebuild the charts to be confgurable.
    

Installation
------------

1. Obtain the code from github:

    git clone https://github.com/luizerico/sigeri

2. Install zend and other dependencies using composer:

    cd /directory/project
    php composer.phar self-update
    php composer.phar install

3. Create and populate the database:

    mysql create database sigeri
    cat sigeri.sql | mysql -u <user> -p sigeri

4. Configure the user and password of MySQL database on /directory/project/config/autoload/doctrine.global.php and config/autoload/global.php.


Web Server Setup
----------------

### PHP CLI Server

The simplest way to get started if you are using PHP 5.4 or above is to start the internal PHP cli-server in the root directory:

    php -S 0.0.0.0:8088 -t public/ public/index.php

This will start the cli-server on port 8080, and bind it to all network
interfaces.

**Note: ** The built-in CLI server is *for development only*.

### Apache and PHP Setup 

Install php-intl or the application will not run. Enable mod-rewrite on apache's configuration.

To setup apache, setup a virtual host to point to the public/ directory of the
project and you should be ready to go!:

    Listen 8088
    <VirtualHost *:8088>
        ServerName sigeri.localhost
        DocumentRoot /path/to/sigeri/public
        SetEnv APPLICATION_ENV "development"
        
        RewriteEngine On
        ErrorLog ${APACHE_LOG_DIR}/sigeri-error.log
        CustomLog ${APACHE_LOG_DIR}/sigeri-access.log combined
        
        <Directory /path/to/sigeri/public>
            DirectoryIndex index.php
            AllowOverride All
            Order allow,deny
            Allow from all
        </Directory>
    </VirtualHost>
