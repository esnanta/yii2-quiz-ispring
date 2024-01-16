<?php

namespace frontend\assets;

use yii\web\AssetBundle;

/**
 * Main frontend application asset bundle.
 */
class B4UnifyMarketingAsset extends AssetBundle
{
    public $basePath = '@webroot/themes-b4/unify263-marketing';
    public $baseUrl = '@web/themes-b4/unify263-marketing';
    
    public $css = [

        //Google Fonts
        'https://fonts.googleapis.com/css?family=Encode+Sans:400,500,600',
        
        //CSS Global Compulsory
        'assets/vendor/bootstrap/bootstrap.min.css',
        
        //CSS Implementing Plugins
        'assets/vendor/icon-awesome/css/font-awesome.min.css',
        'assets/vendor/icon-line-pro/style.css',
        'assets/vendor/icon-hs/style.css',
        'assets/vendor/dzsparallaxer/dzsparallaxer.css',
        'assets/vendor/dzsparallaxer/dzsscroller/scroller.css',
        'assets/vendor/dzsparallaxer/advancedscroller/plugin.css',
        'assets/vendor/animate.css',
        'assets/vendor/hs-megamenu/src/hs.megamenu.css',
        'assets/vendor/hamburgers/hamburgers.min.css',
        'assets/vendor/fancybox/jquery.fancybox.css',
        'assets/vendor/slick-carousel/slick/slick.css',
        
        //CSS Unify Theme
        'assets/css/styles.multipage-marketing.css',
        
        //CSS Customization
        'assets/css/custom.css',

    ];
    
    public $js = [
        //JS Global Compulsory
        
        'assets/vendor/jquery/jquery.min.js',
        'assets/vendor/jquery-migrate/jquery-migrate.min.js',
        'assets/vendor/popper.js/popper.min.js',
        'assets/vendor/bootstrap/bootstrap.min.js',
        
        //JS Implementing Plugins
        'assets/vendor/hs-megamenu/src/hs.megamenu.js',
        'assets/vendor/dzsparallaxer/dzsparallaxer.js',
        'assets/vendor/dzsparallaxer/dzsscroller/scroller.js',
        'assets/vendor/dzsparallaxer/advancedscroller/plugin.js',
        'assets/vendor/fancybox/jquery.fancybox.min.js',
        'assets/vendor/slick-carousel/slick/slick.js',
        
        //JS Unify
        'assets/js/hs.core.js',
        'assets/js/components/hs.header.js',        
        'assets/js/helpers/hs.hamburgers.js',
        'assets/js/components/hs.dropdown.js',
        'assets/js/components/hs.popup.js',
        'assets/js/components/hs.carousel.js', 
        'assets/js/components/hs.go-to.js',

        //JS Customization
        //JS Plugins Init
        'assets/js/custom.js'

        
    ];
    public $depends = [
        'yii\web\YiiAsset',
        //'yii\bootstrap4\BootstrapAsset',
    ];
}

