<?php
/** @var yii\web\View $this */
$this->title = Yii::$app->name;

use common\helper\DateHelper;
use common\helper\LabelHelper;
use yii\helpers\Html;
use yii\helpers\Url;

/** @var yii\web\View $this */
/** @var common\models\Schedule $listUpcomingSchedule */
/** @var common\models\Schedule $listRecentSchedule */
/** @var common\models\Schedule $countAllSchedule */
/** @var common\models\Schedule $countUpcomingSchedule */
/** @var common\models\Participant $countOfflineParticipant */
/** @var common\models\Participant $countOnlineParticipant */
?>


<!-- Content Row -->
<div class="row">

    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                            <?= Yii::t('app', 'Participant (Offline)'); ?>
                        </div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <?= $countOfflineParticipant ?>
                        </div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-user fa-2x text-gray-300"></i>
                    </div>
                </div>
                <a href="<?= Url::to(['profile/index']) ?>" class="card-link stretched-link"></a>
            </div>
        </div>
    </div>

    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-success shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                            <?= Yii::t('app', 'Participant (Online)'); ?>
                        </div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <?= $countOnlineParticipant ?>
                        </div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-user fa-2x text-primary"></i>
                    </div>
                </div>
                <a href="<?= Url::to(['profile/index']) ?>" class="card-link stretched-link"></a>
            </div>
        </div>
    </div>


    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-success shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                            <?= Yii::t('app', 'Schedule (Started)'); ?>
                        </div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <?= $countAllSchedule ?>
                        </div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                    </div>
                </div>
                <a href="<?= Url::to(['schedule/index']) ?>" class="card-link stretched-link"></a>
            </div>
        </div>
    </div>

    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-success shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                            <?= Yii::t('app', 'Schedule (Upcoming)'); ?>
                        </div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <?= $countUpcomingSchedule ?>
                        </div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-comments fa-2x text-gray-300"></i>
                    </div>
                </div>
                <a href="<?= Url::to(['schedule/index']) ?>" class="card-link stretched-link"></a>
            </div>
        </div>
    </div>
</div>

<!-- Content Row -->
<div class="card border-default mb-3">
    <div class="card-header">
        <?= Yii::t('app', 'Schedule'); ?>
        <span class="float-right float-end">
        </span>
    </div>
    <div class="card-body text-default">
        <div class="row">
            <div class="col-md-7 col-xs-12">

                <?php
                $this->registerJs("
                    $('#calendar').fullCalendar({
                        events: '" . Url::to(['site/get-schedules']) . "',
                        editable: false,
                        eventLimit: true,
                        header: {
                            left: 'prev,next today',
                            center: 'title',
                            right: 'month,agendaWeek,agendaDay'
                        },
                        timeFormat: 'H:mm', // 24-hour format (HH:mm),
                        
                        eventClick: function(event) {
                            if (event.url) {
                                window.location.href = event.url; // Redirect to the schedule URL
                                return false; // Prevent the default action (like opening in a new tab)
                            }
                        }
                    });
                ");
                ?>

                <div id="calendar"></div>
            </div>
            <div class="col-md-5 col-xs-12">
                <h6><?= LabelHelper::getYes(Yii::t('app', 'Upcoming')) ; ?></h6>
                <table class="table table-striped table-sm">
                    <thead>
                        <tr>
                            <th class="center">#</th>
                            <th><?= Yii::t('app', 'Date'); ?></th>
                            <th><?= Yii::t('app', 'Start'); ?></th>
                            <th><?= Yii::t('app', 'Room'); ?></th>
                        </tr>
                    </thead>
                    <tbody>
                    <?php
                    foreach ($listUpcomingSchedule as $i => $schedule) {
                        ?>
                        <tr>
                            <td class="center">
                                <?php
                                echo Html::a($schedule->title, ['schedule/view',
                                    'id' => $schedule->id,
                                    'title' => $schedule->title
                                ]);
                                ?>
                            </td>
                            <td class="left">
                                <?= DateHelper::formatDate($schedule->date_start); ?>
                            </td>
                            <td class="left">
                                <?= DateHelper::formatTime($schedule->date_start); ?>
                            </td>
                            <td class="left">
                                <?= $schedule->room->title; ?>
                            </td>
                        </tr>
                    <?php } ?>
                    </tbody>
                </table>

                <h6><strong><?= LabelHelper::getNo(Yii::t('app', 'Recent')) ; ?></strong></h6>
                <table class="table table-striped table-sm">
                    <thead>
                    <tr>
                        <th class="center">#</th>
                        <th><?= Yii::t('app', 'Date'); ?></th>
                        <th><?= Yii::t('app', 'Start'); ?></th>
                        <th><?= Yii::t('app', 'Room'); ?></th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php
                    foreach ($listRecentSchedule as $i => $schedule) {
                        ?>
                        <tr>
                            <td class="center">
                                <?php
                                echo Html::a($schedule->title, ['schedule/view',
                                    'id' => $schedule->id,
                                    'title' => $schedule->title
                                ]);
                                ?>
                            </td>
                            <td class="left">
                                <?= DateHelper::formatDate($schedule->date_start); ?>
                            </td>
                            <td class="left">
                                <?= DateHelper::formatTime($schedule->date_start); ?>
                            </td>
                            <td class="left">
                                <?= $schedule->room->title; ?>
                            </td>
                        </tr>
                    <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</div>

