<?php


// ** MySQL settings ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wptest16');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', 'root');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

define('AUTH_KEY',         '.}~ET:C%&iBgI2-%E~3/:se)+PXXxW<t J/M+,2[E]+vj~F][YGI,aeHnC/Ku@/p');
define('SECURE_AUTH_KEY',  '!oa:xK7~jgDwc~~G0t^2y+!16p{m@3oi=,EEOm(%N-7F,`EsxI[-#n)L[fql|j%[');
define('LOGGED_IN_KEY',    'g:tdTJ5V?FL-GFq49qBIJVD*/sL6Sc5G|God$,uWmiU )paeJ%W})2dMu9UfpnBj');
define('NONCE_KEY',        'ob!r>B-cZ9USg~?)o^WA/(C{$$z?-Fbj8I,^/mrB@S+G}Rd&1}.(wK$>aC&$h$3[');
define('AUTH_SALT',        'Vw 86}f>>F02n~k%3_YohQ[pSZXV-(Ycyv(3Jq=9M^E|<+oeT1k 1:-P&$Qu)W[X');
define('SECURE_AUTH_SALT', '=GHYQwS9JT-4Q-W=38 ,y}aV)Lt||L5b^ulQN?q-6ycp]g#ky0wO%IX!q&W_bLMT');
define('LOGGED_IN_SALT',   'Uy,lI[Q&/.a3NzU$dVpBt:VaD~zh(:vp$E8(z8wuH<KBLc}^j8p_7uhl~Uo)L+8-');
define('NONCE_SALT',       'Mj$w_aWinz%Dc%mfubwFqFg(|*GYgATx7$z0}Y,YPc$[Bh`C-@T2-@d5+KkP`V;A');

define( 'WP_CONTENT_DIR', dirname(__FILE__) . '/wp-content' );
define( 'WP_CONTENT_URL', 'http://localhost/wpstartingpack/wp-content' );
define( 'WP_PLUGIN_DIR', dirname(__FILE__) . '/wp-content/plugins' );
define( 'WP_PLUGIN_URL', 'http://localhost/wpstartingpack/wp-content/plugins' );


$table_prefix = 'wp_';


define( 'WP_DEBUG', true );
define( 'WP_DEBUG_LOG', true );



/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */


require_once(ABSPATH . 'wp-settings.php');
