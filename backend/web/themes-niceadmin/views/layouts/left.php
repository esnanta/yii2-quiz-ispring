<?php

use common\service\CacheService;
use common\models\Page;
use kartik\widgets\SideNav;

?>

<?php //$this->registerCsrfMetaTags() ?>


<style>
    /* Basic styling for the sidebar */
    .sidebar-nav .nav-link {
        color: #000; /* Adjust text color */
        font-size: 14px;
        padding: 10px 15px;
        display: flex;
        align-items: center;
    }

    .sidebar-nav .nav-link .icon {
        margin-right: 10px; /* Adjust icon spacing */
    }

    .sidebar-nav .nav-link:hover {
        background-color: #f8f9fa; /* Adjust hover effect */
    }

    .sidebar-nav .nav-item.active > .nav-link {
        background-color: #007bff; /* Active item background */
        color: #fff; /* Active item text color */
    }

    /* Sidebar toggler styling */
    #sidebarToggle {
        margin-top: 15px;
        background-color: #007bff;
        color: #fff;
        padding: 10px;
        border-radius: 50%;
    }

    /* Print styling */
    @media print {
        .dontprint {
            display: none;
        }
    }
</style>

<div>

    <?php


    if (!Yii::$app->user->isGuest) {

        $authItemName   = CacheService::getInstance()->getAuthItemName();
        $officeId       = CacheService::getInstance()->getOfficeId();

        $officeMenuVisibility = false;
        if($authItemName == Yii::$app->params['userRoleAdmin'] ||
            $authItemName == Yii::$app->params['userRoleOwner']){
            $officeMenuVisibility = true;
        }

        echo SideNav::widget([
            'type' => SideNav::TYPE_INFO,
            'encodeLabels' => false,

            // Sidebar ul options
            'options' => [
                'id' => 'sidebar-nav',
                'class' => 'sidebar-nav dontprint list-unstyled'
            ],

            // Adding background and text color
            'addlCssClass' => 'text-dark bg-white',

            // Active item class
            'activeCssClass' => 'active',

            // Item options for each nav item
            'itemOptions' => ['class' => 'nav-item'],

            // Sidebar items configuration
            'items' => [
                ['label' => Yii::t('app', 'Home'), 'icon' => 'home', 'url' => ['/site/index']],

                ['label' => Yii::t('app', 'Office'), 'icon' => 'university', 'items' => [
                    ['label' => Yii::t('app', 'Staff'), 'icon' => 'chevron-circle-right', 'items' => [
                        ['label' => Yii::t('app', 'Employment'), 'url' => ['/employment/index']],
                        ['label' => Yii::t('app', 'Staff'), 'url' => ['/staff/index'] ],
                        ['label' => Yii::t('app', 'Add Staff'), 'url' => ['/site/create-reguler']]
                    ]],
                    ['label' => Yii::t('app', 'Page'), 'icon' => 'chevron-circle-right', 'items' => [
                        ['label' => Yii::t('app', 'Text'), 'url' => ['/page/index','type'=> Page::PAGE_TYPE_TEXT]],
                        ['label' => Yii::t('app', 'Image'), 'url' => ['/page/index','type'=> Page::PAGE_TYPE_IMAGE] ],
                    ]],
                    ['label' => Yii::t('app', 'Office'), 'url' => ['/office/index']],
                ],'visible' => $officeMenuVisibility],

                ['label' => Yii::t('app', 'Quiz'), 'icon' => 'clipboard-list', 'items' => [
                    ['label' => Yii::t('app', 'Participant'), 'url' => ['/participant/index']],
                    ['label' => Yii::t('app', 'Schedule'), 'url' => ['/schedule/index']],
                    ['label' => Yii::t('app', 'Assessment'), 'url' => ['/assessment/index']],
                ]],
                ['label' => Yii::t('app', 'Asset'), 'icon' => 'shopping-basket', 'items' => [
                    ['label' => Yii::t('app', 'Index'), 'url' => ['/asset/index']],
                    ['label' => Yii::t('app', 'Asset Category'), 'url' => ['/asset-category/index']],
                    ['label' => Yii::t('app', 'Import'), 'url' => ['/participant/select']],
                ]],
                ['label' => Yii::t('app', 'Report'), 'icon' => 'file', 'items' => [
                    ['label' => Yii::t('app', 'Participant Card'), 'url' => ['/report/participant-card']],
                    ['label' => Yii::t('app', 'Assessment Score'), 'url' => ['/report/assessment-score']],
                ]],
                ['label' => Yii::t('app', 'Master'), 'icon' => 'cloud', 'items' => [
                    ['label' => Yii::t('app', 'Period'), 'url' => ['/period/index']],
                    ['label' => Yii::t('app', 'Room'), 'url' => ['/room/index']],
                    ['label' => Yii::t('app', 'Subject'), 'url' => ['/subject/index']],
                    ['label' => Yii::t('app', 'Group'), 'url' => ['/group/index']],
                ]],
                ['label' => Yii::t('app', 'Download'), 'icon' => 'download', 'items' => [
                    ['label' => Yii::t('app', 'Template'), 'url' => ['/participant/download']]
                ]],
                ['label' => Yii::t('app', 'Admin'), 'icon' => 'user-secret', 'items' => [
                    ['label' => Yii::t('app', 'Create'), 'url' => ['/site/create-owner']],
                    ['label' => Yii::t('app', 'User'), 'url' => ['/user/admin/index']],
                    ['label' => Yii::t('app', 'Gii'), 'url' => ['/gii']],
                    ['label' => Yii::t('app', 'Dummy'), 'url' => ['/dummy/view'],
                        'visible'=> (YII_ENV == true) ],
                ], 'visible' => Yii::$app->user->identity->isAdmin],

                ['label' => 'Logout', 'icon' => 'sign-out-alt',
                    'url' => ['/user/logout'],
                    'template'=>'<a href="{url}" data-method="post" data-confirm="Logout now?" class="nav-link text-secondary nav-link">{icon}{label}</a>',
                ],
            ],
        ]);
    } else {
        echo SideNav::widget([
            'type' => SideNav::TYPE_SECONDARY,
            'encodeLabels' => false,
            'heading' => '<i class="fas fa-user-shield"></i> Credentials',
            'items' => [
                ['label' => 'Login', 'icon' => 'fas fa-lock', 'url' => ['/user/login']],
            ],
        ]);
    }
    ?>
</div>