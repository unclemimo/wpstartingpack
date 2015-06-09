<?php
// Local server settings


// Prevent file from being accessed directly
if (!defined('ABSPATH')) exit();

define('DB_NAME',     'databasename'); //Database name
define('DB_USER',     'root'); //Database username
define('DB_PASSWORD', 'root'); //Database password
define('DB_HOST',     'localhost');
define('DB_CHARSET',  'utf8');
define('DB_COLLATE',  '');

// IMPORTANT!
	// Don't use this values! Generate random keys in https://api.wordpress.org/secret-key/1.1/salt/
	// and replace it.
//
define('AUTH_KEY',         '~f*6@%~f~&uS@hp-bqCN[#Y*frIIH-tU&+puIt%cQe|P)WN:BqY],zxuL(VV|h^}');
define('SECURE_AUTH_KEY',  'w!+[7+qz %={<.*y>#HLA.)sd|AW>p+4Pm$a: >w>neZb$`P;w>Of|G*pqJ|P1_I');
define('LOGGED_IN_KEY',    '{Dz62}!^m{_NZbZR^?lv+|Y}_={YMmKQS5_aab^y)^L?YagIv-E9QLvW)-ngsqC!');
define('NONCE_KEY',        ') ARK=70T5kJ3,Y=-/)sX$+:%F^e:u;w:]z)N|7QWFHK$.Sz;p|HMY5pw 6yA[+t');
define('AUTH_SALT',        '7)Z#GO+NL(Bx|,%~-Aj${:<aybZNp^ei|jt|xu)/+ok,h;sE4EIO9;ki#N|vh3-=');
define('SECURE_AUTH_SALT', 'wo}Nuho@E|}-RP+9YZ@w1:2ZGBOvt*bI|Ou%D^%hcO/N|oNC-w6AVKP,NZsVi~sh');
define('LOGGED_IN_SALT',   '{7cB.=1E zF-+,7/1-,cG6>KU&%kkFV-d&$N)jiF$:!`a@|6f^r1)x4N+#o@/^_i');
define('NONCE_SALT',       'iExoZ_uawD8z~=keU)(j;4O@)#$#ZR?~Q2dIjH/nHx2&UYK:M>:9Y=cw8D?8c+(3');

$table_prefix = 'wp_'; // To improve security, use a different value: http://codex.wordpress.org/Editing_wp-config.php#table_prefix

define('WPLANG',   '');
define('WP_DEBUG', false); //Hide errors