<?php

use common\helper\DateHelper;
use common\helper\IconHelper;
use common\models\Profile;
use common\service\CacheService;
use common\service\ScheduleService;
use yii\helpers\Html;
use yii\helpers\Url;

$model = null;
if (!Yii::$app->user->isGuest) {
    $model = Profile::findOne(['user_id' => Yii::$app->user->identity->id]);
}

function renderDropdownItem($url, $icon, $text)
{
    return Html::a(
        $icon . '<p class="mb-0 fs-3">' . $text . '</p>',
        $url,
        ['class' => 'd-flex align-items-center gap-2 dropdown-item']
    );
}

?>
<header class="app-header">
    <nav class="navbar navbar-expand-lg navbar-light">
        <ul class="navbar-nav">
            <li class="nav-item d-block d-xl-none">
                <a class="nav-link sidebartoggler nav-icon-hover" id="headerCollapse" href="javascript:void(0)">
                    <i class="ti ti-menu-2"></i>
                </a>
            </li>

            <!-- DROPDOWN SCHEDULE -->
            <li class="nav-item dropdown">
                <a class="nav-link nav-icon-hover" href="javascript:void(0)" id="drop1" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="ti ti-bell-ringing"></i>
                    <div class="notification bg-primary rounded-circle"></div>
                </a>

                <div class="dropdown-menu dropdown-menu-sm-right dropdown-menu-animate-up" aria-labelledby="drop1">
                    <div class="message-body">
                        <?php if (!Yii::$app->user->isGuest): ?>
                            <?php
                            $scheduleService = new ScheduleService();
                            $officeId = CacheService::getInstance()->getOfficeIdByProfile();
                            $participant = Profile::findOne([
                                'office_id' => $officeId,
                                'user_id' => Yii::$app->user->identity->id
                            ]);
                            $listUpcomingSchedule = $scheduleService->getScheduleUpcomingByGroup($officeId, $participant->group_id);

                            if (!empty($listUpcomingSchedule)) {
                                foreach ($listUpcomingSchedule as $schedule) {
                                    echo renderDropdownItem(
                                        Url::to(['schedule/index']),
                                        IconHelper::getExclamation(),
                                        $schedule->description . ' start at ' . DateHelper::formatDateTime($schedule->date_start)
                                    );
                                }
                            } else {
                                echo renderDropdownItem(
                                    Url::to(['#']),
                                    IconHelper::getExclamation(),
                                    Yii::t('app', 'No upcoming schedule')
                                );
                            }
                            ?>
                        <?php endif; ?>
                    </div>
                </div>
            </li>
        </ul>

        <!-- DROPDOWN USER -->
        <div class="navbar-collapse justify-content-end px-0" id="navbarNav">
            <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
                <?php if (!Yii::$app->user->isGuest && $model): ?>
                    <div class="d-none d-md-block">
                        <span class="fw-semibold mb-0"><?= Html::encode($model->name) ?></span><br>
                        <small><?= Html::encode($model->group->title) ?> - <?= Html::encode($model->office->title) ?></small>
                    </div>
                <?php endif; ?>

                <li class="nav-item dropdown">
                    <a class="nav-link nav-icon-hover" href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="<?= Url::base() ?>/frontend/web/themes-b5-modernize/assets/images/profile/user-1.jpg" alt="" width="35" height="35" class="rounded-circle" alt="<?= $model->title ?? '' ?>">
                    </a>
                    <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="drop2">
                        <div class="message-body">
                            <?php if (!Yii::$app->user->isGuest): ?>
                                <?= renderDropdownItem(Url::to(['site/index']), '<i class="ti ti-user fs-6"></i>', 'Dashboard') ?>
                                <?= Html::a('Logout', ['/user/logout'], ['data-method' => 'POST', 'data-confirm' => 'Logout?', 'class' => 'btn btn-outline-primary mx-3 mt-2 d-block']) ?>
                            <?php else: ?>
                                <?= Html::a(Yii::t('app', 'Admin'), ['/admin/user/login'], ['class' => 'btn btn-outline-primary mx-3 mt-2 d-block']) ?>
                            <?php endif; ?>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
</header>
