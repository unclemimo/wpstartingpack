:computer: WP starting pack v1.0
============

This script offers a modern workflow to manage Wordpress installation and setup very seamsly. Through a user prompt in the command line you can:

- [x] Install the latest version of Wordpress with Composer.
- [x] Setup WP core in a custom directory (site up and running in http://localhost/yoursite).
- [x] Move wp-config.php from WP core  directory (https://wordpress.stackexchange.com/questions/58391/is-moving-wp-config-outside-the-web-root-really-beneficial).
- [x] Create DB in your local system (if it doesn't exist).
- [x] Custom wp-content directory, outside WP folder (the script does the needed modifications to wp-config.php file).
- [x] Installation and activation of your prefered plugins (a set of common plugins are predefined).
- [x] WP-SYNC plugin installation, to manage your DB through differents enviroments.

In 2 minutes, you will have a fresh Wordpress installation, with a lot of security and performance tweaks, plugins and more.

![alt text](https://media.giphy.com/media/xT0xesfMzr1lw06vsI/giphy.gif "WP Starting Pack")

## :alien: Where's the magic?

It manages Wordpress installation with Composer. Set up is done with WP-CLI and BASH scripting.

WP starting pack is an internal project of [Atias Web](https://atiasweb.com/), a web design and development company. It hasn't been developed from scratch, but by putting together many techinques and methods.

We want to make of it a maintainable and stable alternative for launching fresh and highly top-notch WP install. 

Furthermore, we have GIT and Continous Integration in mind, so whoever in the team can build up and recreate the project in any devolopment enviroment.

## :pencil2: System requeriments:

Before getting started, make sure you have installed, up and running:

- PHP 5.3.2+
- Composer: https://getcomposer.org/.
- WP CLI: https://wp-cli.org/

It has been tested on Mac OS. It should works on Linux systems as well.

## :running: Getting started

__1. In terminal, go to the project folder and type (as root, or using sudo):__

```bash
$ composer install
$ chmod +x wpconfigure.sh
$ ./wpconfigure.sh
```

## :hand: To do:

- [ ] Configure multi-enviroment through the command prompt setup (https://github.com/studio24/wordpress-multi-env-config or similar).
- [ ] Generate salt keys in wp-config files.
- [ ] Custom underscore Wordpress theme.
- [ ] WP core as a GIT submodule.
- [ ] Random generate a random WP password (and copy it to clipboard).
- [ ] Handle Wordpress download and installation with WP CLI instead of Composer.

## :interrobang: Reported issues

> "env: mysql: No such file or directory" error: https://stackoverflow.com/questions/44440064/env-mysql-no-such-file-or-directory-after-wp-import#44856936

> "Unable to connect to MySQL server": MAMP or local server not running (yeah, this happens) :sweat_smile:.

> Error: Error establishing a database connection. This either means that the username and password information in your `wp-config.php` file is incorrect or we can’t contact the database server at `localhost`: https://make.wordpress.org/cli/handbook/installing/#using-a-custom-php-binary and https://github.com/wp-cli/wp-cli/issues/2662

## :books: References

1. https://github.com/micahblu/wp-launchpad
2. http://roots.io/using-composer-with-wordpress/
3. https://deliciousbrains.com/how-why-install-wordpress-core-subdirectory/
