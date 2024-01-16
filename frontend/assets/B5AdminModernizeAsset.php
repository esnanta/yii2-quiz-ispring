<?php

namespace frontend\assets;

use yii\web\AssetBundle;

/**
 * Main backend application asset bundle.
 */
class B5AdminModernizeAsset extends AssetBundle
{
    public $basePath = '@webroot/themes-b5-modernize';
    public $baseUrl = '@web/themes-b5-modernize';
    public $css = [

        'https://use.fontawesome.com/releases/v5.3.1/css/all.css',
        'assets/vendor/icon-awesome/css/font-awesome.min.css',
        
        //CSS Global Compulsory
        'assets/css/styles.min.css',
    ];
  
    public $js = [
        //Global Compulsory
        //'assets/libs/jquery/dist/jquery.min.js',// DISABLE FOR SELECT2
        'assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js',
        'assets/js/sidebarmenu.js',
        'assets/js/app.min.js',
        'assets/libs/apexcharts/dist/apexcharts.min.js',
        'assets/libs/simplebar/dist/simplebar.js',
        'assets/js/dashboard.js'
    ];

    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap5\BootstrapAsset',
    ];
}
