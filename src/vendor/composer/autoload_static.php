<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInite3335989aafc1249ea3cb4dbd115b0e9
{
    public static $prefixLengthsPsr4 = array (
        'P' => 
        array (
            'Predis\\' => 7,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Predis\\' => 
        array (
            0 => __DIR__ . '/..' . '/predis/predis/src',
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInite3335989aafc1249ea3cb4dbd115b0e9::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInite3335989aafc1249ea3cb4dbd115b0e9::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInite3335989aafc1249ea3cb4dbd115b0e9::$classMap;

        }, null, ClassLoader::class);
    }
}