<?php
$params = array_merge(
    require __DIR__ . '/../../common/config/params.php',
    require __DIR__ . '/../../common/config/params-local.php',
    require __DIR__ . '/params.php',
    require __DIR__ . '/params-local.php'
);

//https://www.yiiframework.com/wiki/755/how-to-hide-frontendweb-in-url-addresses-on-apache
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
                    'class' => \yii\log\FileTarget::class,
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],

        //DEFAULT
//        'view' => [
//            'theme' => [
//                'pathMap' => [
//                    '@app/views' => '@app/views',
//                    '@dektrium/user/views' => '@app/views/user'
//                ],
//            ],
//        ],

        //BOOSTRAP 4
//        'view' => [
//            'theme' => [
//                'pathMap' => [
//                    '@app/views' => '@app/web/themes-b4/unify263-charity/views',
//                    '@dektrium/user/views' => '@app/web/themes-b4/unify263-charity/views/user'
//                ],
//                'basePath' => '@app/web/themes-b4/unify263-charity',
//                'baseUrl' => '@web/web/themes-b4/unify263-charity',
//            ],
//        ],
        
        
//        'view' => [
//            'theme' => [
//                'pathMap' => [
//                    '@app/views' => '@app/web/themes-b4/unify263-marketing/views',
//                    '@dektrium/user/views' => '@app/web/themes-b4/unify263-marketing/views/user'
//                ],
//                'basePath' => '@app/web/themes-b4/unify263-marketing',
//                'baseUrl' => '@web/web/themes-b4/unify263-marketing',
//            ],
//        ],
        
        //BOOSTRAP 5 - Unify 322 Customer-Stories
//        'view' => [
//            'theme' => [
//                'pathMap' => [
//                    '@app/views' => '@app/web/themes-b5/unify322-cust-stories/views',
//                    '@dektrium/user/views' => '@app/web/themes-b5/unify322-cust-stories/views/user'
//                ],
//                'basePath' => '@app/web/themes-b5/unify322-cust-stories',
//                'baseUrl' => '@web/web/themes-b5/unify322-cust-stories',
//            ],
//        ],

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
