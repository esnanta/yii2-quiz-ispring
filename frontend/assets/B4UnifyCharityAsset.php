<?php

namespace frontend\assets;

use yii\web\AssetBundle;

/**
 * Main frontend application asset bundle.
 */
class B4UnifyCharityAsset extends AssetBundle
{
    public $basePath = '@webroot/themes-b4/unify263-charity';
    public $baseUrl = '@web/themes-b4/unify263-charity';
    
    public $css = [
        
        'https://fonts.googleapis.com/css?family=Open+Sans:400,300,500,600,700,800',
        
        //CSS Global Compulsory 
        //'assets/vendor/bootstrap/bootstrap.min.css',

        // CSS Implementing Plugins 
        'assets/vendor/icon-awesome/css/font-awesome.min.css',
        'assets/vendor/icon-line-pro/style.css',
        'assets/vendor/icon-line/css/simple-line-icons.css',
        'assets/vendor/icon-hs/style.css',
        'assets/vendor/hamburgers/hamburgers.min.css',
        'assets/vendor/animate.css',
        'assets/vendor/slick-carousel/slick/slick.css',

        //CSS Template 
        'assets/css/styles.op-charity.css',

        //CSS Customization
        'assets/css/custom.css',

    ];
    public $js = [
        
        //JS Global Compulsory
        //'assets/vendor/jquery/jquery.min.js',
        'assets/vendor/jquery-migrate/jquery-migrate.min.js',
        'assets/vendor/popper.js/popper.min.js',
        //'assets/vendor/bootstrap/bootstrap.min.js',

        //JS Implementing Plugins
        'assets/vendor/appear.js',
        'assets/vendor/circles/circles.min.js',
        'assets/vendor/slick-carousel/slick/slick.js',
        'assets/vendor/jquery.easypin.custom/dist/jquery.easypin.js',

        //JS Unify 
        'assets/js/hs.core.js',
        'assets/js/components/hs.header.js',
        'assets/js/helpers/hs.hamburgers.js',
        'assets/js/components/hs.scroll-nav.js',
        'assets/js/components/hs.progress-bar.js',
        'assets/js/components/hs.chart-pie.js',
        'assets/js/components/hs.carousel.js',
        'assets/js/components/hs.map.pin.js',
        'assets/js/components/hs.go-to.js',

        //JS Customization
        'assets/js/custom.js',
        
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap4\BootstrapAsset',
    ];
}
