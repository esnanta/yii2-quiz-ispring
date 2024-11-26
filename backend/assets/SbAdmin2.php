<?php

namespace backend\assets;

use yii\web\AssetBundle;

class SbAdmin2 extends AssetBundle
{
    public $basePath = '@webroot/themes-sbadmin2';
    public $baseUrl = '@web/themes-sbadmin2';

    public $css = [
        // Existing CSS files
        'https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i',
        'assets/vendor/fontawesome-free/css/all.min.css',
        'assets/css/sb-admin-2.min.css',

        // FullCalendar CSS
        'assets/vendor/fullcalendar-3.10.2/fullcalendar.min.css',
    ];

    public $js = [
        // Existing JS files
        'assets/vendor/bootstrap/js/bootstrap.bundle.min.js',
        'assets/vendor/jquery-easing/jquery.easing.min.js',
        'assets/js/sb-admin-2.min.js',

        // Moment.js and FullCalendar JS
        'assets/vendor/moment-2.29.1/moment.min.js',
        'assets/vendor/fullcalendar-3.10.2/fullcalendar.min.js',
    ];

    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap4\BootstrapAsset',
        'yii\web\JqueryAsset', // Ensure that jQuery is loaded
    ];
}
