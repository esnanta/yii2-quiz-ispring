<?php
$params = array_merge(
    require __DIR__ . '/../../common/config/params.php',
    require __DIR__ . '/../../common/config/params-local.php',
    require __DIR__ . '/params.php',
    require __DIR__ . '/params-local.php'
);

//https://www.yiiframework.com/wiki/755/how-to-hide-frontendweb-in-url-addresses-on-apache
use yii\log\FileTarget;
use \yii\web\Request;
$baseUrl = str_replace('/frontend/web', '', (new Request)->getBaseUrl());

return [
    'id' => 'app-frontend',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'controllerNamespace' => 'frontend\controllers',
    
    'modules' => [
        'user' => [
            // following line will restrict access to admin controller from frontend application
            'as frontend' => 'dektrium\user\filters\FrontendFilter',
        ],
    ],
    
    'components' => [

        //https://www.yiiframework.com/doc/api/2.0/yii-web-user
        'user' => [
            'class' => 'yii\web\User',
            'identityCookie' => [
                'name'     => '_identity-frontend6',
                'path'     => '/',
                'httpOnly' => true,
            ],
        ],

        'session' => [
            'class' => 'yii\web\DbSession',
            'name' => 'frontend-SESSID',
            'cookieParams' => [
                'httpOnly' => true,
                'path'     => '/',
            ],
        ],

        'request' => [
            'csrfParam' => '_csrf-frontend',
            'class' => 'common\components\Request',
            'web' => '/frontend/web',
            'baseUrl' => $baseUrl,
        ],
                    
                    
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => FileTarget::class,
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],

        //BOOSTRAP 5 - Modernize
        'view' => [
            'theme' => [
                'pathMap' => [
                    '@app/views' => '@app/web/themes-b5-modernize/views',
                    '@dektrium/user/views' => '@app/views/user'
                ],
                'basePath' => '@app/web/themes-b5-modernize',
                'baseUrl' => '@web/web/themes-b5-modernize',
            ],
        ],

    ],

    'params' => $params,
];
