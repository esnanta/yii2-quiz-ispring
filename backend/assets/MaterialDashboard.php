<?php

namespace backend\assets;

use yii\web\AssetBundle;

/**
 * Main backend application asset bundle.
 */
class MaterialDashboard extends AssetBundle
{
    public $basePath = '@webroot/themes-material-dashboard';
    public $baseUrl = '@web/themes-material-dashboard';
    public $css = [

        'https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700',
        'https://use.fontawesome.com/releases/v5.3.1/css/all.css',

        'assets/css/nucleo-icons.css.css',
        'assets/css/nucleo-svg.css',
        'https://kit.fontawesome.com/42d5adcbca.js',
        'https://fonts.googleapis.com/icon?family=Material+Icons+Round',
        'assets/css/material-dashboard.css?v=3.1.0'
    ];
    public $js = [
        'assets/js/core/popper.min.js',
        'assets/js/core/bootstrap.min.js',
        'assets/js/plugins/perfect-scrollbar.min..js',
        'assets/js/plugins/smooth-scrollbar.min.js',
        'assets/js/plugins/chartjs.min.js',
        'https://buttons.github.io/buttons.js',
        'assets/js/material-dashboard.min.js?v=3.1.0'
    ];

    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap5\BootstrapAsset',
    ];
}
