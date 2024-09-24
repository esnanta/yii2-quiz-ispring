<?php

use common\models\Page;
use common\service\CacheService;
use kartik\widgets\SideNav;

?>

<?php $this->registerCsrfMetaTags() ?>

<style media="print">
    .dontprint {
        display: none;
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
            
            //FOR <ul>
            'options' => [
                'id'=>'accordionSidebar',
                'class' => 'navbar-nav bg-gradient-primary sidebar sidebar-dark accordion dontprint'
            ], // Modify the menu's HTML attributes
//
            'addlCssClass' => 'text-dark bg-white',
//
//            // Add this class to the active menu item
//            'activeCssClass' => 'active',
//
//            // Add this class to each menu item
//            'itemOptions' => ['class' => 'nav-item'],

            // Customize link template
            //'linkTemplate' => '<a href="{url}" class="text-secondary">{label}</a>',

            'items' => [
                ['label' => Yii::t('app', 'Home'), 'icon' => 'home', 'url' => ['/site/index']],
                
                ['label' => Yii::t('app', 'Office'), 'icon' => 'university', 'items' => [
                    ['label' => Yii::t('app', 'Staff'), 'icon' => 'chevron-circle-right', 'items' => [
                        ['label' => Yii::t('app', 'Employment'), 'url' => ['/employment/index']],
                        ['label' => Yii::t('app', 'Staff'), 'url' => ['/staff/index'] ],
                        //['label' => Yii::t('app', 'Add Staff'), 'url' => ['/site/create-reguler']]
                    ]],
                    ['label' => Yii::t('app', 'Page'), 'icon' => 'chevron-circle-right', 'items' => [
                        ['label' => Yii::t('app', 'Text'), 'url' => ['/page/index','type'=> Page::PAGE_TYPE_TEXT]],
                        ['label' => Yii::t('app', 'Image'), 'url' => ['/page/index','type'=> Page::PAGE_TYPE_IMAGE] ],
                    ]],
                    ['label' => Yii::t('app', 'Office'), 'url' => ['/office/index']],
                ],'visible' => $officeMenuVisibility],
                ['label' => Yii::t('app', 'Master'), 'icon' => 'cloud', 'items' => [
                    ['label' => Yii::t('app', 'Group'), 'url' => ['/group/index']],
                    ['label' => Yii::t('app', 'Subject'), 'url' => ['/subject/index']],
                    ['label' => Yii::t('app', 'Room'), 'url' => ['/room/index']],
                ]],
                ['label' => Yii::t('app', 'Quiz'), 'icon' => 'clipboard-list', 'items' => [
                    ['label' => Yii::t('app', 'Period'), 'url' => ['/period/index']],
                    ['label' => Yii::t('app', 'Schedule'), 'url' => ['/schedule/index']],
                    ['label' => Yii::t('app', 'Participant'), 'url' => ['/participant/index']],
                    ['label' => Yii::t('app', 'Assessment'), 'url' => ['/assessment/index']],
                ]],
                ['label' => Yii::t('app', 'Asset'), 'icon' => 'shopping-basket', 'items' => [
                    ['label' => Yii::t('app', 'Index'), 'url' => ['/asset/index']],
                    ['label' => Yii::t('app', 'Category'), 'url' => ['/asset-category/index']],
                    //['label' => Yii::t('app', 'Import'), 'url' => ['/participant/select']],
                ]],
                ['label' => Yii::t('app', 'Report'), 'icon' => 'file', 'items' => [
                    ['label' => Yii::t('app', 'Participant Chart'), 'url' => ['/chart/participant']],
                    ['label' => Yii::t('app', 'Participant Card'), 'url' => ['/report/participant-card']],
                    ['label' => Yii::t('app', 'Assessment Score'), 'url' => ['/report/assessment-score']],
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
    }
    else{
        echo SideNav::widget([
            'type' => SideNav::TYPE_SECONDARY,
            'encodeLabels' => false,
            'heading' => '<i class="fas fa-user-shield"></i> Credentials',
            'items' => [
                ['label' => 'Login', 'icon' => 'lock', 'url' => ['/user/login']],
            ],
        ]);
    }
?>

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>
</div>
