WP starting pack
============

This pack aim to offer a modern Wordpress workflow using Composer, Node.js and Grunt.

It manages Wordpress installation with Composer, build up the files using Grunt and create an optimal folder structure, where the index.php file is in the root, Wordpress core files in wp directory and wp-content also in the root.

WP starting pack is an internal project of Atiasweb web design and developent company which is based 80% in the work made by micahblu in https://github.com/micahblu/wp-launchpad.

As WP Launchpad stated:

"The setup is modeled from the guys at [roots.io](http://roots.io/using-composer-with-wordpress/). WP Launchpad uses composer and grunt to create the project structure which places the entire wordpress project in a wp/ directory, copies over wp-content/, index.php and wp-confg-sample.php and makes some modifications to ensure wordpress is cool with everything."

We made some improvements and extra functionalities.

1. Manage multiple enviroments and different wp-config.php credentials for each one. It's really easy to set-up. We use a local, staging and production enviroment, but you can edit or add more depending on your needs.

2. Aditionally, the composer file now manage Wordpress plugins, using the Packgaist repository.

Furthermore, we have GIT and Continous Integration in mind, so whoever in the team can build up and recreate the project in any devolopment enviroment.

## Requeriments:

- Composer, Node and Grunt installed.

## Getting started

__1. In terminal, go to the project folder and type (as root, or using sudo):__

```bash
# composer install
# npm install
# grunt
```

__2. Configure wp-config file:__
 - Download add your database creds to wp-config-sample.php moving it to wp-config.php, 
 - visit the installed url i.e http://localhost/mywpsite, go through the installation setup as usual
 - Finally from wp-admin go to settings->general settings and remove '/wp' from the end of site address (url) option

## References

1. https://github.com/micahblu/wp-launchpad
2. http://roots.io/using-composer-with-wordpress/

## Getting started
