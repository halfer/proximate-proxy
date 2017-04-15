<?php

/**
 * Code to set up a simple HTTP proxy server
 */

$rootPath = realpath(__DIR__ . '/..');
require_once $rootPath . '/vendor/autoload.php';

use Proximate\Proxy\FileProxy;

// Configuration goes here (I could read port and cache dir from env vars)
$hostname = getenv('HOSTNAME');
$port = 8081;
$cacheParent = '/remote'; // The cache system appends '/cache'

try
{
    $proxier = new FileProxy($hostname . ':' . $port, $cacheParent);
    $proxier->
        initSimpleSystem()->
        getProxy()->
        listenLoop();
}
catch (\Proximate\Exception\Init $e)
{
    echo $e->getMessage() . "\n";
}
