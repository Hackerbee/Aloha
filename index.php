<?php
// Version
define('VERSION', '0.0.0.0-alpha1');

// Configuration
if (is_file('config.php')) {
	require_once('config.php');
}

// Startup
require_once(DIR_SYSTEM . 'startup.php');

start('normal');