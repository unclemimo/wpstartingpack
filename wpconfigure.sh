#!/bin/bash

# Variables:

RESET="\033[0m"
BOLD="\033[1m"
YELLOW="\033[38;5;11m"
CURRENT_DIR=${PWD##*/}
green=`tput setaf 2`
reset=`tput sgr0`

# User prompt:

read -p "$(echo -e $BOLD$YELLOW"Enter your desired wordpress core subdirectory (default: wp. Must be the same of the one selected in Composer as WP Subdirectory): "$RESET)" CORE_DIR
CORE_DIR=${CORE_DIR:-wp}
echo "WP subdirectory: $CORE_DIR"


read -p "$(echo -e $BOLD$YELLOW"Enter your desired wordpress content folder name (default: wp-content): "$RESET)" WP_CONTENT_VAR
WP_CONTENT_VAR=${WP_CONTENT_VAR:-wp-content}
echo "WP content folder name: $WP_CONTENT_VAR"


read -p "$(echo -e $BOLD$YELLOW"Enter DB name to be created (default: default): "$RESET)" DB_NAME
DB_NAME=${DB_NAME:-default}
echo "DB name: $DB_NAME"


read -p "$(echo -e $BOLD$YELLOW"Enter DB user (default: root): "$RESET)" DB_USER
DB_USER=${DB_USER:-root}
echo "DB user: $DB_USER"


read -p "$(echo -e $BOLD$YELLOW"Enter DB pass (default: root): "$RESET)" DB_PASS
DB_PASS=${DB_PASS:-root}
echo "DB pass $DB_PASS"


read -p "$(echo -e $BOLD$YELLOW"Enter WP SITE URL (default: http://localhost/$CURRENT_DIR): "$RESET)" SITE_URL
SITE_URL=${SITE_URL:-"http://localhost/$CURRENT_DIR"}
echo "WP Site URL: $SITE_URL"


read -p "$(echo -e $BOLD$YELLOW"Enter WP SITE TITLE (default: Unclemimo WPStartingpack): "$RESET)" SITE_TITLE
SITE_TITLE=${SITE_TITLE:-Unclemimo WPStartingpack}
echo "WP Site Title: $SITE_TITLE"


read -p "$(echo -e $BOLD$YELLOW"Enter WP site user (default: admin): "$RESET)" SITE_USER
SITE_USER=${SITE_USER:-admin}
echo "WP Site user: $SITE_USER"


read -p "$(echo -e $BOLD$YELLOW"Enter WP site password (default: admin): "$RESET)" SITE_PASS
SITE_PASS=${SITE_PASS:-admin}
echo "WP Site pass: $SITE_PASS"


read -p "$(echo -e $BOLD$YELLOW"Enter WP site email (default: you@domain.com): "$RESET)" SITE_EMAIL
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
sed -ie "s/'\/wp-blog-header.php/'\/$CORE_DIR\/wp-blog-header.php/g" index.php
rm index.phpe

# Update the siteurl in the database with sub directory path
wp option update siteurl $(wp option get siteurl)/$CORE_DIR --path=$CORE_DIR

# Move wp/wp-content to ./$WP_CONTENT_VAR

if [ ! -d "$WP_CONTENT_VAR" ]; then
  mkdir $WP_CONTENT_VAR
fi
chmod -v 755 $CORE_DIR/wp-content/*
rsync -av $CORE_DIR/wp-content/* $WP_CONTENT_VAR/

# Uncomment the below line if you want the config in root
mv "$CORE_DIR/wp-config.php" ./wp-config.php

# Install/activate plugins
wp plugin install https://github.com/wp-sync-db/wp-sync-db/archive/master.zip --activate
#wp plugin install w3-total-cache --activate
#wp plugin install wordpress-seo --activate
#wp plugin install amp --activate
#wp plugin install glue-for-yoast-seo-amp --activate
#wp plugin install google-sitemap-generator --activate
#wp plugin install themecheck --activate
#wp plugin install better-wp-security --activate
#wp plugin install shortcodes-ultimate --activate
#wp plugin install wysija-newsletters --activate
#wp plugin install contact-form-7 --activate
#wp plugin install xcloner-backup-and-restore	 --activate
#wp plugin install google-analytics-for-wordpress --activate
#wp plugin install updraftplus --activate
#wp plugin install advanced-custom-fields --activate
#wp plugin install internet-explorer-alert --activate
#wp plugin install disable-comments --activate
#wp plugin install master-slider --activate
#wp plugin install sweet-alert-add-on-for-contact-form-7 --activate
#wp plugin install admin-bar-disabler --activate
#wp plugin install disable-comments --activate
#wp plugin install majpage-menu-class-extender --activate
#wp plugin install widget-css-classes --activate
#wp plugin install disable-comments --activate
#wp plugin install sendgrid-email-delivery-simplified --activate
#wp plugin install really-simple-ssl --activate
#wp plugin install wp-db-backup --activate
# Install: composer require roots/wp-password-bcrypt


# Verify if there are more files in wp/wp-content and move it to the new folder (./$WP_CONTENT_VAR)

if [  -d "$WP_CONTENT_VAR" ]; then
  rsync -av $CORE_DIR/$WP_CONTENT_VAR/* $WP_CONTENT_VAR/
  rm -rf $CORE_DIR/$WP_CONTENT_VAR/

  rsync -av $CORE_DIR/wp-content/* $WP_CONTENT_VAR/
  rm -rf $CORE_DIR/wp-content
fi


echo "${green}Installation finished!${reset}"