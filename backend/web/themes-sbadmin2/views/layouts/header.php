<?php

use common\models\Staff;
use common\service\CacheService;
use yii\bootstrap4\Breadcrumbs;
use yii\bootstrap4\Html;
use yii\helpers\Url;

$flushMenuEnabled       = false;
$activityMenuEnabled    = false;

if (!Yii::$app->user->isGuest) {

    $officeId       = CacheService::getInstance()->getOfficeId();
    $staffId        = CacheService::getInstance()->getStaffId();
    $staff          = Staff::find()->where(['id'=>$staffId])->one();
    $authItemName   = CacheService::getInstance()->getAuthItemName();
    
    $flushMenuEnabled = ($authItemName == Yii::$app->params['userRoleAdmin']) ? true:false;
    
    if($authItemName == Yii::$app->params['userRoleAdmin'] ||
        $authItemName == Yii::$app->params['userRoleOwner']){
        $activityMenuEnabled = true;
    }
}
?>

<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

    <!-- Sidebar Toggle (Topbar) -->
    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
        <i class="fa fa-bars"></i>
    </button>


    <?=
    Breadcrumbs::widget([
        'links' => $this->params['breadcrumbs'] ?? [],
    ])
    ?>

    <!-- Topbar Navbar -->
    <ul class="navbar-nav ml-auto">

        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
        <li class="nav-item dropdown no-arrow d-sm-none">
            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
            </a>
            <!-- Dropdown - Messages -->
            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                 aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                    <div class="input-group">
                        <input type="text" class="form-control bg-light border-0 small"
                               placeholder="Search for..." aria-label="Search"
                               aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="button">
                                <i class="fas fa-search fa-sm"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </li>

        <!-- Nav Item - Tools Dropdown -->
        <?php if (!Yii::$app->user->isGuest) { ?>
        <li class="nav-item dropdown no-arrow mx-1">
            <a class="nav-link dropdown-toggle" href="#" id="toolsDropdown" role="button"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-tools fa-fw text-primary"></i>
                <span class="d-none d-lg-inline ml-1 text-primary">Tools</span>
            </a>
            <!-- Dropdown - Tools -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                 aria-labelledby="toolsDropdown">
                <h6 class="dropdown-header">Menu:</h6>
                <?= Html::a(
                    '<i class="fas fa-file-import fa-sm fa-fw mr-2 text-primary"></i> Import Users',
                    ['/asset/create', 'isImport' => true],
                    ['class' => 'dropdown-item']
                ) ?>
                <?= Html::a(
                    '<i class="fas fa-download fa-sm fa-fw mr-2 text-primary"></i> Download Template',
                    ['/profile/download'],
                    ['class' => 'dropdown-item']
                ) ?>
            </div>
        </li>
        <?php } ?>

        <!-- Nav Item - Reset Cache -->
        <li class="nav-item dropdown no-arrow mx-1">
            <?=
            ($flushMenuEnabled==true) ?
                Html::a(
                    '<i class="fas fa-recycle fa-fw text-primary"></i>
                    <span class="d-none d-lg-inline ml-1 text-primary">Reset Cache</span>',
                    ['/site/flush'],
                    [
                            'data-method' => 'post',
                            'data-confirm' => 'Reset Cache?',
                            'class' => 'nav-link',
                            'role' => 'button',
                            'title'=>'Reset Cache'
                    ]
                )
                :'';
            ?>
        </li>

        <div class="topbar-divider d-none d-sm-block"></div>

        <?php if(Yii::$app->user->isGuest) { ?>

        <li class="nav-item dropdown no-arrow">

            <?=
                Html::a(
                    'Login &#160; <i class="fas fa-sign-in-alt"></i>',
                    ['/user/login'],
                    [
                        'class' => 'nav-link',
                        'role' => 'button',
                        'title'=>'Login'
                    ]
                );
            ?>

        </li>
        <?php } else { ?>

        <!-- Nav Item - User Information -->
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><?= $staff->title;?></span>
                <img class="img-profile rounded-circle"
                     src="<?= $staff->getAssetUrl();?>">
            </a>
            <!-- Dropdown - User Information -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                 aria-labelledby="userDropdown">
                <a class="dropdown-item" href="<?= Url::to(['/staff/view','id'=>$staff->id])?>">
                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                    Profile
                </a>
                <div class="dropdown-divider"></div>
                <?php
                    $logout = '<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> Logout';
                    echo Html::a(
                        $logout,
                        ['/user/logout'],
                        ['data-method' => 'post',
                            'data-confirm' => 'Logout now?',
                            'class' => 'dropdown-item',
                            'title' => 'Sign Out']);
                ?>
            </div>
        </li>
        <?php } ?>
    </ul>
</nav>
