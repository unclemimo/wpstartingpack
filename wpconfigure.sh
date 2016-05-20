#!/bin/bash
# Source: https://deliciousbrains.com/how-why-install-wordpress-core-subdirectory/

# Composer script to run: composer config extra.wordpress-install-dir --unset ; composer config extra.wordpress-install-dir wordpressfolderpost ; composer install ; chmod +x wpconfigure.sh ; ./wpconfigure.sh
# WP_SUBDIR=wordpressfold; composer config extra --unset;composer config extra.installer-paths.wp/wp-content/mu-plugins/{$name}/ --unset;composer config extra.installer-paths.wp/wp-content/plugins/{$name}/ --unset;composer config extra.installer-paths.wp/wp-content/themes/{$name}/ --unset ;composer config extra.wordpress-install-dir $WP_SUBDIR ;composer config extra.installer-paths.$WP_SUBDIR/wp-content/mu-plugins/{$name}/ ["type:wordpress-muplugin"];composer config extra.installer-paths.$WP_SUBDIR/wp-content/plugins/{$name}/ ["type:wordpress-plugin"];composer config extra.installer-paths.$WP_SUBDIR/wp-content/themes/{$name}/ ["type:wordpress-theme"];composer install;chmod +x wpconfigure.sh;./wpconfigure.sh


# Installation:





# Install the script in one of the folders in your PATH. Make sure it has execute permissions (i.e. chmod +x wp-install-core-sub-dir).
  
#Usage:

# This is a simple script as an example, it could be improved by accepting parameters etc.

#Ask:
# DB NAME (you want to create), DB USER, DB PASS, SITE URL, WP USER, WP PASS, WP EMAIL, 

#CORE_DIR=wp
#DB_NAME=wptest21
#DB_USER=root
#DB_PASS=root

#SITE_URL=http://localhost/wpstartingpack 
#SITE_TITLE='Unclemimo WPStartingpack'
#SITE_USER=admin
#SITE_PASS=admin
#SITE_EMAIL=daam37@gmail.com


read -p "Enter your desired wordpress core subdirectory (default: wp. Must be the same of the one selected in Composer as WP Subdirectory): " CORE_DIR
CORE_DIR=${CORE_DIR:-wp}
echo "WP subdirectory: $CORE_DIR"

read -p "Enter your desired wordpress content folder name (default: wp-content): " WP_CONTENT_VAR
WP_CONTENT_VAR=${WP_CONTENT_VAR:-wp-content}
echo "WP content folder name: $WP_CONTENT_VAR"

read -p "Enter DB name (default: default): " DB_NAME
DB_NAME=${DB_NAME:-default}
echo "DB name: $DB_NAME"

read -p "Enter DB user (default: root): " DB_USER
DB_USER=${DB_USER:-root}
echo "DB user: $DB_USER"

read -p "Enter DB pass (default: root): " DB_PASS
DB_PASS=${DB_PASS:-root}
echo "DB pass $DB_PASS"

read -p "Enter WP SITE URL (default: http://localhost/yoursite): " SITE_URL
SITE_URL=${SITE_URL:-"http://localhost/yoursite"}
echo "WP Site URL: $SITE_URL"

read -p "Enter WP SITE TITLE (default: Unclemimo WPStartingpack): " SITE_TITLE
SITE_TITLE=${SITE_TITLE:-Unclemimo WPStartingpack}
echo "WP Site Title: $SITE_TITLE"

read -p "Enter WP site user (default: admin): " SITE_USER
SITE_USER=${SITE_USER:-admin}
echo "WP Site user: $SITE_USER"

read -p "Enter WP site password (default: admin): " SITE_PASS
SITE_PASS=${SITE_PASS:-admin}
echo "WP Site pass: $SITE_PASS"

read -p "Enter WP site email (default: you@domain.com): " SITE_EMAIL
SITE_EMAIL=${SITE_EMAIL:-"you@domain.com"}
echo "WP Site email: $SITE_EMAIL"


# create the wp-config.php file
wp core config --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --path=$CORE_DIR --extra-php --allow-root <<PHP
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_LOG', true );
define( 'WP_CONTENT_DIR', dirname(__FILE__) . '/$WP_CONTENT_VAR' );
define( 'WP_CONTENT_URL', '$SITE_URL/$WP_CONTENT_VAR' );
define( 'WP_PLUGIN_DIR', dirname(__FILE__) . '/$WP_CONTENT_VAR/plugins' );
define( 'WP_PLUGIN_URL', '$SITE_URL/$WP_CONTENT_VAR/plugins' );
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

# Move wp/wp-content to ./wp-content

chmod -v 755 $CORE_DIR/wp-content/*
mv  -v $CORE_DIR/wp-content/* /wp-content/

# Rename WP Content folder (if it applies)
mv /wp-content/ /$WP_CONTENT_VAR/

# Uncomment the below line if you want the config in root
mv "$CORE_DIR/wp-config.php" ./wp-config.php

echo 'Installation finished!'