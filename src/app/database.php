<?php

return [
    /**
     * Options (mysql, sqlite)
     */
    'driver' => 'mysql', //mude aqui para sqlite
    'sqlite' => [
        'database' => 'localhost',
    ],
    'mysql' => [
        'host' => 'localhost',
        'database' => 'coremvc_2',
        'user' => 'root',
        'pass' => '',
        'charset' => 'utf8',
        'collation' => 'utf8_unicode_ci'
    ]
];
