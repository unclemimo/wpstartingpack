#!/bin/bash
# Source: https://deliciousbrains.com/how-why-install-wordpress-core-subdirectory/

# Installation:
  
# Install the script in one of the folders in your PATH. Make sure it has execute permissions (i.e. chmod +x wp-install-core-sub-dir).
  
#Usage:

# This is a simple script as an example, it could be improved by accepting parameters etc.

#Ask:
# DB NAME (you want to create), DB USER, DB PASS, SITE URL, WP USER, WP PASS, WP EMAIL, 

CORE_DIR=wp
DB_NAME=wptest13
DB_USER=root
DB_PASS=root

SITE_URL=http://localhost/wptest 
SITE_TITLE='Unclemimo WPStartingpack'
SITE_USER=admin
SITE_PASS=admin
SITE_EMAIL=daam37@gmail.com

# create the wp-config.php file
wp core config --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --path=$CORE_DIR --extra-php --allow-root <<PHP
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_LOG', true );
PHP

# create the dabase
wp db create --path=$CORE_DIR

# install WordPress (less than 5 mins)
wp core install --url=$SITE_URL --title="$SITE_TITLE" --admin_user=$SITE_USER --admin_password=$SITE_PASS --admin_email=$SITE_EMAIL --path=$CORE_DIR

# Copy (not move) index.php file to root
cp "$CORE_DIR/index.php" ./index.php

# Edit index.php to point to correct path of wp-blog-header.php
sed -ie "s/'\/wp-blog-header.php/'\/wp\/wp-blog-header.php/g" index.php
rm index.phpe
# Update the siteurl in the database with sub directory path
wp option update siteurl $(wp option get siteurl)/$CORE_DIR --path=wp

# Uncomment the below line if you want the config in root
cp "$CORE_DIR/wp-config.php" ./wp-config.php
rm -rf "$CORE_DIR/wp-config.php"

echo 'Install finished!'