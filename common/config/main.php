<?php
use \kartik\datecontrol\Module;
return [
    'aliases' => [
        '@bower' => '@vendor/bower-asset',
        '@npm' => '@vendor/npm-asset',
    ],

    'name'=>'Pertashop',
    'timeZone' => 'Asia/Bangkok',
    'language' => 'id-ID',
    
    'vendorPath' => dirname(dirname(__DIR__)) . '/vendor',

    'components' => [
        'db' => [
            'class' => \yii\db\Connection::class,
            'dsn' => 'mysql:host=localhost;dbname=yii2_cbt_ispring',
            'username' => 'root',
            'password' => '',
            'charset' => 'utf8',
            'tablePrefix' => 'tx_',
            'enableSchemaCache' => false,
            'schemaCacheDuration' => 3600, // Duration of schema cache.
            'schemaCache' => 'cache', // Name of the cache component used to store schema information
        ],

        'authManager' => [
            'class' => 'dektrium\rbac\components\DbManager',
            'defaultRoles' => ['guest'],
        ],

        'cache' => [
            'class' => \yii\caching\FileCache::class,
        ],

        'urlManager' => [
            'class' => 'yii\web\UrlManager',
            'enablePrettyUrl' => true,
            'showScriptName' => false,
            'enableStrictParsing' => false,
            'rules' => [
                '<controller:\w+>/<id:\d+>' => '<controller>/view',
                '<controller:\w+>/<action:\w+>/<id:\d+>' => '<controller>/<action>',
                '<controller:\w+>/<action:\w+>' => '<controller>/<action>',
            ],
        ],

        /*
         * 'locale' => 'id-ID', 
         * This configuration also used in
         *  - account_payable.js
         *  - purchase.js
         */
        'formatter' => [
            'class' => 'yii\i18n\Formatter',
            'locale' => 'id-ID', 
            //'dateFormat' => 'dd-MM-yyyy',
            'thousandSeparator' => '.',
            'decimalSeparator' => ',',
        ],  
        
        //php yii message/extract @common/config/i18n.php
        'i18n' => [
            'translations' => [
                'app*' => [
                    'class' => 'yii\i18n\PhpMessageSource',
                    'sourceLanguage' => 'en-US',
                    'basePath' => '@common/messages',
                ],
            ],
        ],

        //https://www.yiiframework.com/doc/api/2.0/yii-web-user
        'user' => [
            'class' => 'yii\web\User',
            'identityCookie' => [
                'name'     => '_allIdentityhere',
                'path'     => '/',
                'httpOnly' => true,
            ],
        ],
        'session' => [
            'class' => 'yii\web\DbSession',
            'name' => 'my-ALL-SESSID',
            'cookieParams' => [
                'httpOnly' => true,
                'path'     => '/',
            ],
        ],
    ],

    'modules' => [

        'user' => [
            'class' => 'dektrium\user\Module',
            'enableUnconfirmedLogin' => false,
            'enablePasswordRecovery' => false,
            'enableRegistration' => false,
            'enableConfirmation' => false,
            'confirmWithin' => 21600,
            'cost' => 12,
            'admins' => ['admin'],
            // you will configure your module inside this file
            // or if need different configuration for frontend and backend you may
            // configure in needed configs
            'modelMap' => [
                'User' => 'common\models\User',
            ],

            'controllerMap' => [
                'registration' => [
                    'class' => \dektrium\user\controllers\RegistrationController::className(),
                    'on ' . \dektrium\user\controllers\RegistrationController::EVENT_AFTER_REGISTER => function ($e) {
                        Yii::$app->response->redirect(array('/user/security/login'))->send();
                        Yii::$app->end();
                    },
                    'class' => \dektrium\user\controllers\RegistrationController::className(),
                    'on ' . \dektrium\user\controllers\RegistrationController::EVENT_AFTER_CONFIRM => function ($e) {
                        Yii::$app->response->redirect(array('/user/security/login'))->send();
                        Yii::$app->end();
                    },
                    'class' => \dektrium\user\controllers\RegistrationController::className(),
                    'on ' . \dektrium\user\controllers\RegistrationController::EVENT_AFTER_RESEND => function ($e) {
                        Yii::$app->response->redirect(array('/user/security/login'))->send();
                        Yii::$app->end();
                    }

                ],
            ],

            //CHECK MAILER IN MAIN-LOCAL.PHP
            'mailer' => [
                'viewPath' => '@common/mail',
                'sender' => ['no-reply@smanmba.sch.id' => 'PSB SMAN Modal Bangsa Arun']
            ]
        ],

        'rbac' => 'dektrium\rbac\RbacWebModule',

        //https://github.com/mootensai/yii2-enhanced-gii
        'gridview' => [
            'class' => '\kartik\grid\Module',
        // see settings on http://demos.krajee.com/grid#module
        ],

        'datecontrol' =>  [
            'class' => '\kartik\datecontrol\Module',

            // format settings for displaying each date attribute (ICU format example)
            'displaySettings' => [
                Module::FORMAT_DATE => 'dd-MM-yyyy',
                Module::FORMAT_TIME => 'hh:mm:ss a',
                Module::FORMAT_DATETIME => 'dd-MM-yyyy hh:mm:ss a',
            ],
            
            // format settings for saving each date attribute (PHP format example)
            'saveSettings' => [
                Module::FORMAT_DATE => 'php:Y-m-d',
                Module::FORMAT_TIME => 'php:H:i:s',
                Module::FORMAT_DATETIME => 'php:Y-m-d H:i:s',
            ],
            
            'ajaxConversion'=>false,
            
            // automatically use kartik\widgets for each of the above formats
            'autoWidget' => true,

            // default settings for each widget from kartik\widgets used when autoWidget is true
            'autoWidgetSettings' => [
                Module::FORMAT_DATE => ['type'=>2, 'pluginOptions'=>['autoclose'=>true]], // example
                Module::FORMAT_DATETIME => [], // setup if needed
                Module::FORMAT_TIME => [], // setup if needed
            ],            
        ]

    ],

];
