<?php
// Site
$_['site_base']         = HTTP_SERVER;
$_['site_ssl']          = HTTPS_SERVER;

// Database
$_['db_autostart']      = true;
$_['db_type']           = DB_DRIVER; // mpdo, mssql, mysql, mysqli or postgre
$_['db_hostname']       = DB_HOSTNAME;
$_['db_username']       = DB_USERNAME;
$_['db_password']       = DB_PASSWORD;
$_['db_database']       = DB_DATABASE;
$_['db_port']           = DB_PORT;

// Session
$_['session_autostart'] = false;

// Actions
$_['action_pre_action'] = array(
	'startup/session',
	'startup/startup',
	// 'startup/login',
	'startup/error',
	'startup/seo_url',
);

// Actions
$_['action_default'] = 'common/home';

// App settings

$_['config_encryption'] = 'aloha';
$_['config_compression'] = 0;
$_['config_seo_url'] = 0;
