<?php

/**
 * Code to set up a simple HTTP proxy server
 */

$rootPath = realpath(__DIR__ . '/..');
require_once $rootPath . '/vendor/autoload.php';

use Proximate\Proxy\FileProxy;

try
{
    $hostname = getenv('HOSTNAME');
    $proxier = new FileProxy($hostname . ':8081', $rootPath);
    $proxier->
        setup()->
        getProxy()->
        listenLoop();
}
catch (\Proximate\Exception\Init $e)
{
    echo $e->getMessage() . "\n";
}
