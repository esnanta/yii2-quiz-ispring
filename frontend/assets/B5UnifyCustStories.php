<?php

namespace frontend\assets;

use yii\web\AssetBundle;

/**
 * Main frontend application asset bundle.
 */
class B5UnifyCustStories extends AssetBundle
{
    public $basePath = '@webroot/themes-b5/unify322-cust-stories';
    public $baseUrl = '@web/themes-b5/unify322-cust-stories';
    
    public $css = [
        'https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap',
        
        //CSS Implementing Plugins
        'assets/vendor/bootstrap-icons/font/bootstrap-icons.css',
        'assets/vendor/hs-mega-menu/dist/hs-mega-menu.min.css',
        'assets/vendor/swiper/swiper-bundle.min.css',
        
        //CSS Unify Template
        'assets/css/theme.min.css'

    ];

    public $js = [
        
        //JS Implementing Plugins
        'assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js',
        'assets/vendor/hs-header/dist/hs-header.min.js',
        'assets/vendor/hs-mega-menu/dist/hs-mega-menu.min.js',
        'assets/vendor/hs-go-to/dist/hs-go-to.min.js',
        'assets/vendor/swiper/swiper-bundle.min.js',
        
        //JS Unify
        'assets/js/theme.min.js',
        'assets/js/theme-custom.min.js'
    ];
    
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap5\BootstrapAsset',
    ];
}
