WP starting pack
============

This script offer a modern workflow to manage Wordpress installation and setup very seamsly. Through a user prompt in the command line you can:

* Install the latest version of Wordpress with Composer.
* Setup WP core in a custom directory (site up and running in http://localhost/yoursite).
* Move wp-config.php from WP core  directory (https://wordpress.stackexchange.com/questions/58391/is-moving-wp-config-outside-the-web-root-really-beneficial).
* Create DB in your local system (if it doesn't exist).
* Custom wp-content directory, outside WP folder (the script does the needed modifications to wp-config.php file).
* Installation and activation of your prefered plugins (a set of common plugins are predefined).
* WP-SYNC plugin to manage your DB through differents enviroments.
* Configure multi-enviroment through the setup (Comming soon).
* Generate salt keys in all wp-config files (Coming soon).
* Custom underscore Wordpress theme (Coming soon).
* WP core as a GIT submodule (Coming soon).

In 5 minutes, you will have a fresh Wordpress installation, with a lot of security and performance tweaks, plugins and more.

## Whats the magic?

It manages Wordpress installation with Composer. Set up is done with WP-CLI and BASH scripting. At the end, cames Grunt to edit and move some files/folders.

WP starting pack is an internal project of Atiasweb web design and developent company. It hasn't been developed from scratch, but by putting together many techinques and methods.

We want to make of it a maintainable and stable alternative for launching fresh and highly top-notch WP install. 

Furthermore, we have GIT and Continous Integration in mind, so whoever in the team can build up and recreate the project in any devolopment enviroment.

## System requeriments:

Before getting started, make sure you have installed, up and running:

- PHP 5.3.2+
- Composer: https://getcomposer.org/.
- WP CLI: https://wp-cli.org/
- Node.js: https://nodejs.org/en/
- Grunt: http://gruntjs.com/

It has been tested on Mac. I realise that it should work on Linux as well.

## Getting started

__1. In terminal, go to the project folder and type (as root, or using sudo):__

```bash
# WP_SUBDIR=wp; composer install;
# chmod +x wpconfigure.sh; wpconfigure.sh
```

## References

1. https://github.com/micahblu/wp-launchpad
2. http://roots.io/using-composer-with-wordpress/
3. https://deliciousbrains.com/how-why-install-wordpress-core-subdirectory/
