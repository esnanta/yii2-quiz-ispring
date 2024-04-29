<?php

use common\models\ScheduleDetail;
use kartik\widgets\SideNav;
// OR if this package is installed separately, you can use
// use kartik\sidenav\SideNav;

use common\helper\CacheCloud;
?>

<?php //$this->registerCsrfMetaTags() ?>

<style media="print">
    .dontprint {
        display: none;
    }
</style>


<div>

<?php
    if (!Yii::$app->user->isGuest) {

        $authItemName   = CacheCloud::getInstance()->getAuthItemName();
        $officeId       = CacheCloud::getInstance()->getOfficeId();
        
        $officeMenuVisibility = false;
        if($authItemName == Yii::$app->params['userRoleAdmin'] ||
            $authItemName == Yii::$app->params['userRoleOwner']){
            $officeMenuVisibility = true;
        }

        $badgeHeader = '<span class="u-badge-v1 g-bg-yellow g-rounded-50x", 
                                style="position:relative"><i class="fa fa-exclamation"></i></span>';

        $scheduleDetailBadge = ScheduleDetail::find('asset_name')
            ->where(['office_id'=>$officeId,'asset_name'=>null])
            ->count();
        $scheduleDetailBadgeHeader = '';
        $scheduleDetailBadgeDetail = '';
        if($scheduleDetailBadge > 0):
            $scheduleDetailBadgeHeader = $badgeHeader;
            $scheduleDetailBadgeDetail = '<span class="u-badge-v1 g-color-white g-bg-blue g-rounded-50x g-mt-5 g-mr-5", 
                                        style="position:relative">'.$scheduleDetailBadge.'</span>';
        endif;


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
                    ['label' => Yii::t('app', 'Employment'), 'url' => ['/employment/index']],
                    ['label' => Yii::t('app', 'Staff'), 'url' => ['/staff/index'] ],
                    ['label' => Yii::t('app', 'Office'), 'url' => ['/office/index']],
                    ['label' => Yii::t('app', 'Add Staff'), 'url' => ['/site/create-reguler']]
                    //['label' => Yii::t('app', 'Theme'), 'url' => ['/theme/index']],
                ],'visible' => $officeMenuVisibility],


                ['label' => Yii::t('app', 'Master'), 'icon' => 'cloud', 'items' => [
                    ['label' => Yii::t('app', 'Archive Category'), 'url' => ['/archive-category/index']],
                    ['label' => Yii::t('app', 'Archive'), 'url' => ['/archive/index']],
                    ['label' => Yii::t('app', 'Period'), 'url' => ['/period/index']],
                    ['label' => Yii::t('app', 'Room'), 'url' => ['/room/index']],
                    ['label' => Yii::t('app', 'Subject'), 'url' => ['/subject/index']],
                    ['label' => Yii::t('app', 'Group'), 'url' => ['/group/index']],
                ]],

                ['label' => Yii::t('app', 'Data'), 'icon' => 'download', 'items' => [
                    ['label' => Yii::t('app', 'Template'), 'url' => ['/participant/download']],
                    ['label' => Yii::t('app', 'Import'), 'url' => ['/participant/select']],
                ]],

                ['label' => Yii::t('app', 'Quiz') .' '.$scheduleDetailBadgeHeader, 'icon' => 'clipboard-list', 'items' => [
                    ['label' => Yii::t('app', 'Participant'), 'url' => ['/participant/index']],
                    ['label' => Yii::t('app', 'Schedule') .' '.$scheduleDetailBadgeDetail, 'url' => ['/schedule/index']],

                ]],
                ['label' => Yii::t('app', 'Assessment'), 'icon' => 'book-reader', 'items' => [
                    ['label' => Yii::t('app', 'Index'), 'url' => ['/assessment/index']],
                    ['label' => Yii::t('app', 'Detail'), 'url' => ['/assessment-detail/index']],
                    ['label' => Yii::t('app', 'Export'), 'url' => ['/assessment/report']],
                ]],
                
                ['label' => Yii::t('app', 'Admin'), 'icon' => 'user-secret', 'items' => [
                    ['label' => Yii::t('app', 'Create'), 'url' => ['/site/create-owner']],
                    ['label' => Yii::t('app', 'User'), 'url' => ['/user/admin/index']],
                    ['label' => Yii::t('app', 'Gii'), 'url' => ['/gii']],
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
