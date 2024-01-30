<?php

use yii\bootstrap5\Breadcrumbs;
use yii\helpers\Url;
use yii\bootstrap5\Html;

use common\models\Staff;
use common\helper\CacheCloud;

$flushMenuEnabled       = false;
$activityMenuEnabled    = false;

if (!Yii::$app->user->isGuest) {

    $officeId       = CacheCloud::getInstance()->getOfficeId();
    $staffId        = CacheCloud::getInstance()->getStaffId();
    $staff          = Staff::find()->where(['id'=>$staffId])->one();
    $authItemName   = CacheCloud::getInstance()->getAuthItemName();
    
    $flushMenuEnabled = ($authItemName == Yii::$app->params['userRoleAdmin']) ? true:false;
    
    if($authItemName == Yii::$app->params['userRoleAdmin'] ||
        $authItemName == Yii::$app->params['userRoleOwner']){
        $activityMenuEnabled = true;
    }
}
?>


<nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" data-scroll="true">
    <div class="container-fluid py-1 px-3">
        <?=
        Breadcrumbs::widget([
            'links' => $this->params['breadcrumbs'] ?? [],
        ])
        ?>

<!--        <nav aria-label="breadcrumb">-->
<!--            <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">-->
<!--                <li class="breadcrumb-item text-sm">-->
<!---->
<!--                    <a class="text-dark"-->
<!--                       href="--><?php //= Url::to(['/site/index'])?><!--">-->
<!--                        Home-->
<!--                    </a>-->
<!--                </li>-->
<!--                <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Dashboard</li>-->
<!--            </ol>-->
<!--            <h6 class="font-weight-bolder mb-0">Dashboard</h6>-->
<!--        </nav>-->


        <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
            <div class="ms-md-auto pe-md-3 d-flex align-items-center">
<!--                <div class="input-group input-group-outline">-->
<!--                    <label class="form-label">Type here...</label>-->
<!--                    <input type="text" class="form-control">-->
<!--                </div>-->
            </div>

            <ul class="navbar-nav  justify-content-end">
                <li class="nav-item px-3 d-flex align-items-center">
                    <?=
                    ($flushMenuEnabled==true) ?
                        Html::a(
                            '<i class="fa fa-recycle fixed-plugin-button-nav cursor-pointer"></i>',
                            ['/site/flush'],
                            ['data-method' => 'post',
                                'data-confirm' => 'Flush now?',
                                'class' => 'nav-link text-body p-0',
                                'title'=>'Flush']
                        )
                        :'';
                    ?>
                </li>

                <li class="nav-item dropdown pe-2 d-flex align-items-center">
                    <a href="javascript:;" class="nav-link text-body p-0"
                       id="dropdownMenuButton"
                       data-bs-toggle="dropdown"
                       aria-expanded="false">
                        <i class="fa fa-user cursor-pointer"></i>
                    </a>
                    <ul class="dropdown-menu  dropdown-menu-end  px-2 py-3 me-sm-n4"
                        aria-labelledby="dropdownMenuButton">
                        <li class="mb-2">
                            <a class="dropdown-item border-radius-md" href="javascript:;">
                                <div class="d-flex py-1">
                                    <div class="d-flex flex-column justify-content-center">
                                        <h6 class="text-sm font-weight-normal mb-1">
                                            <span class="font-weight-bold">
                                                Profile
                                            </span>
                                        </h6>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </li>


                <li class="nav-item d-flex align-items-center">
                    <?php if (Yii::$app->user->isGuest) { ?>
                        <a href="<?= Url::to(['/user/login'])?>"
                        class="nav-link text-body font-weight-bold px-0">
                            <i class="fa fa-user me-sm-1"></i>
                            <span class="d-sm-inline d-none">Sign In</span>
                        </a>
                    <?php }  else { ?>

                        <?= Html::a(
                            'Logout',
                            ['/user/logout'],
                            ['data-method' => 'post',
                                'data-confirm' => 'Logout now?',
                                'class' => 'nav-link text-body font-weight-bold px-0',
                                'title'=>'Sign Out']
                        ) ?>

                    <?php } ?>
                </li>
            </ul>
        </div>
    </div>
</nav>




