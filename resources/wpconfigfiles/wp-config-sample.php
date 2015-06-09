<?php

// Set your environment/url pairs
$environments = array(
  'local'       => 'localhost', //Check that your local hostname is localhost, if not, replace it here.
  'staging'     => 'atiasweb.net', //Here, add your stage server's host domain.
  'production'  => 'website.com'   //Production server's host domain.
);

// Get the hostname
$http_host = $_SERVER['HTTP_HOST'];

// Loop through $environments to see if there’s a match
foreach($environments as $environment => $hostname) {
  if (stripos($http_host, $hostname) !== FALSE) {
    define('ENVIRONMENT', $environment);
    break;
  }
}

// Exit if ENVIRONMENT is undefined
if (!defined('ENVIRONMENT')) exit('Error: no database configured for this host');

// Location of environment-specific configuration
$wp_db_config = 'wp-config/wp-db-' . ENVIRONMENT . '.php'; 

// Check if the configuration file for the environment exists
if (file_exists(__DIR__ . '/' . $wp_db_config)) {
  require_once($wp_db_config);
} else {
  // Exit if configuration file does not exist
  exit('Error: no database configuration found for this host. Configuration file does not exist.');
}


// Define /wp as WordPress absolute path to the Wordpress directory.
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . 'wp/');

//Sets up WordPress vars and included files.
require_once(ABSPATH . 'wp-settings.php');

