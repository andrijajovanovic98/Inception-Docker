<?php


define('DB_NAME', 'db_name');
define('DB_USER', 'db_user');
define('DB_PASSWORD', 'db_password');
define('DB_HOST', 'db_host');


define('AUTH_KEY',         'm)5rs`@@Qa)Eq T70rhH2HS$i+^>Ob6^2i^n8C+cKoBN9sA?BY3Qv]UVgdw9LK_h');
define('SECURE_AUTH_KEY',  'bn^IKs_&EbgY:yAG{yUmo??FO9D)3(w15rHxY/!%u9$vERDLYd9^e,] E`k2RS]r');
define('LOGGED_IN_KEY',    'OWp{g%j9A>7luSGX[,9rB_l]H@A<QJP+<H5:HLgZmp{Y8Hj6*Np? /WU,]8cj:}:');
define('NONCE_KEY',        'L=rFr@m)Fb>t#-9u4zvsT4CuHKS^+9YWB!!1~->5;*7^Y`F %}@L}oh-6x[a`wn_');
define('AUTH_SALT',        '~q[8B797yYmgas^ap5Q,au{0lM-v8>};}v`u_?}!<LL%OoEE.{r|+=BMR(>,(u<p');
define('SECURE_AUTH_SALT', 'J%|`I#v<#0Oqj+:,66GB,-OO:*D;Z|/q4a9?M71})n:9Z&/A6mg5n<VsG:C7Zl%s');
define('LOGGED_IN_SALT',   '`^T6TKgj#0MpWiq+ iclL|Nz??D,A+5D!!.be}NWzK,[6SZKj(DKa5x49pIhw%b_');
define('NONCE_SALT',       '|H$8Z:0ibSOxFbq(Bq#b:?k/l5uU~u+/gQI43.]n<#]FXka~K;Lzf,OXta.w1||L');


$table_prefix = 'wp_';

define('WP_DEBUG', false);

if ( !defined('ABSPATH') )
    define('ABSPATH', dirname(__FILE__) . '/');
require_once(ABSPATH . 'wp-settings.php');

