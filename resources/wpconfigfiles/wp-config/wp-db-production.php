<?php
// Prevent file from being accessed directly
if (!defined('ABSPATH')) exit();

// STAGE: http://atiasweb.net/stage/jd-es y http://atiasweb.net/stage-clientes/jd-es

define('DB_NAME',     'XXXX');
define('DB_USER',     'XXXX');
define('DB_PASSWORD', 'XXXX');
define('DB_HOST',     'localhost');
define('DB_CHARSET',  'utf8');
define('DB_COLLATE',  '');

/*
define('WP_SITEURL','http://XXXX.com');
define('WP_HOME','http://XXXX.com/wp');
define('RELOCATE',true); */

// IMPORTANT!
	// Don't use this values! Generate random keys in https://api.wordpress.org/secret-key/1.1/salt/
	// and replace it.
	// Use the same in all the enviroments

define('AUTH_KEY',         'q-.$D*ymmXxuIYDq ql9-IN6cmgrl-e!8)UB^;x?KMkC-y*]-?J+UKkHIo/TM-u<');
define('SECURE_AUTH_KEY',  'dAwh7n1k%K!3zhJoL!_-c/mA<2r?}ucH<Kz=6(:#V%o iI*-I2Gyy3j`Cp#>? y4');
define('LOGGED_IN_KEY',    '!HhR!)[frEzSE{`|/e~Q=fHnWOki9|<Z-}NXWf9q]44Tf=ZFi|qcY]^:A1+`*Dl,');
define('NONCE_KEY',        'i0aUD_8Twr-g*+FiH|M8U3^;bU/U%h$~aKc@squ}W-U^fkJvhwG%+m$kr!48nY A');
define('AUTH_SALT',        '`&%Byv%5#`aWkMvp+NyjB?Q%3d<AKz=^seiIa*e>T*3=:ib&)w!&%iWyg,(t^BsK');
define('SECURE_AUTH_SALT', ' ]`&9|A &Y#QnT|f;KJ,Nh]t)!u?n_U%qyc<{Y{ FfC)T,hC83]b/(Ypm$7%A@&u');
define('LOGGED_IN_SALT',   'c$(r_eCfNkId4igz?0R0;~ }dRK+l-Z/K|5M+[[-=YC:&>IstB+$xD=yV$9Pm${L');
define('NONCE_SALT',       '%V.q|fbn!zm<N^W>DrCqAmLOn3qZ&aG&8y^#VaC-9gZdPH&>$p,m$9LH,B2nLC^{');

$table_prefix = 'wp_';

define('WPLANG',   '');
define('WP_DEBUG', false);