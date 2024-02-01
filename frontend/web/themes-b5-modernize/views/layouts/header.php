<?php

use common\models\Staff;
use common\helper\CacheCloud;
use yii\helpers\Html;
use yii\helpers\Url;

if (!Yii::$app->user->isGuest) {
    $staffId = CacheCloud::getInstance()->getStaffId();
    $model = Staff::find()->where(['id' => $staffId])->one();
}
?>
<header class="app-header">
    <nav class="navbar navbar-expand-lg navbar-light">
        <ul class="navbar-nav">
            <li class="nav-item d-block d-xl-none">
                <a class="nav-link sidebartoggler nav-icon-hover" id="headerCollapse"
                   href="javascript:void(0)">
                    <i class="ti ti-menu-2"></i>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link nav-icon-hover" href="javascript:void(0)">
                    <i class="ti ti-bell-ringing"></i>
                    <div class="notification bg-primary rounded-circle"></div>
                </a>
            </li>
        </ul>
        <div class="navbar-collapse justify-content-end px-0" id="navbarNav">
            <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
                <?php
                if (!Yii::$app->user->isGuest) :
                    ?>
                    <a class="btn btn-md btn-success" style="margin-right:2px"
                       href="<?= str_replace('', '', Url::to(['schedule/index'])) ?>">
                        <?= Yii::t('app', 'Schedule') ?>
                    </a>

                    <a class="btn btn-md btn-primary"
                            href="<?= Url::to(['admin/site/index']) ?>"
                       target="_blank">
                        <?= Yii::t('app', 'Admin') ?>
                    </a>


                <?php endif; ?>

                <li class="nav-item dropdown">
                    <a class="nav-link nav-icon-hover" href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown"
                       aria-expanded="false">

                        <?php if (Yii::$app->user->isGuest) { ?>
                            <img src="<?= Url::base() ?>/frontend/web/themes-b5-modernize/assets/images/profile/user-1.jpg"
                                 alt="" width="35" height="35" class="rounded-circle">
                        <?php } else { ?>
                            <img src="<?= $model->getAssetUrl(); ?>"
                                 alt="" width="35" height="35" class="rounded-circle" alt="<?= $model->title; ?>">
                        <?php } ?>

                    </a>

                    <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="drop2">
                        <div class="message-body">
                            <?php if (!Yii::$app->user->isGuest) { ?>
                                <a href="<?= Url::to(['admin/staff/view', 'id' => $model->id]) ?>"
                                   class="d-flex align-items-center gap-2 dropdown-item">
                                    <i class="ti ti-user fs-6"></i>
                                    <p class="mb-0 fs-3">My Profile</p>
                                </a>

                                <?=
                                Html::a(
                                    'Logout',
                                    ['/user/logout'],
                                    [
                                        'data-method' => 'POST',
                                        'data-confirm' => "Logout?",
                                        'class' => 'btn btn-outline-primary mx-3 mt-2 d-block'
                                    ]
                                )
                                ?>
                            <?php } else { ?>
                            <?=
                                Html::a(
                                    'User',
                                    ['/site/login'],
                                    [
                                        'class' => 'btn btn-outline-primary mx-3 mt-2 d-block'
                                    ]
                                )
                            ?>
                            <?php } ?>
                        </div>

                    </div>
                </li>
            </ul>
        </div>
    </nav>
</header>
