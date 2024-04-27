<?php

use aneeshikmat\yii2\Yii2TimerCountDown\Yii2TimerCountDown;
use common\helper\LabelHelper;
use yii\bootstrap5\Html;
use yii\helpers\Url;

/** @var yii\web\View $this */

$this->title = Yii::$app->name;
?>



<div class="row">
    <div class="col-xs-6 col-sm-3 col-xl-3">
        <div class="card overflow-hidden rounded-2">
            <div class="position-relative">
                <a href="javascript:void(0)">
                    <img src="<?= Url::base() ?>/frontend/web/themes-b5-modernize/assets/images/profile/user-1.jpg"
                         class="card-img-top rounded-0"
                         alt="...">
                </a>
                <a href="javascript:void(0)"
                   class="bg-primary rounded-circle p-2 text-white d-inline-flex position-absolute bottom-0 end-0 mb-n3 me-3"
                   data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Add To Cart"><i
                            class="ti ti-basket fs-4"></i></a></div>
            <div class="card-body pt-3 p-4">
                <h6 class="fw-semibold fs-4">
                    <?= Yii::$app->user->identity->username ?>
                </h6>

                <div class="timeline-desc fs-3 text-dark mt-n1">
                    <?= $participant->title; ?> <br>
                    <?= $participant->group->title; ?>
                </div>

            </div>
        </div>
    </div>

    <div class="col-xs-6 col-sm-9 col-xl-9 d-flex align-items-stretch">
        <div class="card w-100">
            <div class="card-body p-4">
                <div class="mb-4">
                    <h5 class="card-title fw-semibold">
                        <?= Yii::t('app', 'Schedule'); ?>
                    </h5>
                </div>

                <div class="table-responsive-sm">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th class="center">#</th>
                            <th><?= Yii::t('app', 'Schedule'); ?></th>
                            <th><?= Yii::t('app', 'Room'); ?></th>
                            <th><?= Yii::t('app', 'Asset'); ?></th>
                        </tr>
                        </thead>

                        <tbody>
                        <?php
                        foreach ($schedules as $i => $scheduleItem) {
                            $timeReference = strtotime($scheduleItem->date_start);
                            $currentTime = strtotime("now");
                            $minutesDifference = round(abs(($timeReference - $currentTime) / 60));

                            //10 MINUTES BEFORE START, CHANGE REFERENCE TO DATE_END
                            if ($timeReference < $currentTime) :
                                $timeReference = strtotime($scheduleItem->date_end);
                            endif;
                        ?>
                        <tr>
                            <td class="center"><?= ($i + 1); ?></td>
                            <!-- SCHEDULE-->
                            <td class="left">
                                <?= Yii::$app->formatter->format($scheduleItem->date_start, 'date'); ?>
                                <br>
                                <?= Yii::t('app', 'Start'); ?> :
                                <?= date('H:i:s', strtotime($scheduleItem->date_start)); ?>

                                <br>

                                <?php
                                $minutesTolerance = 10; //minutes
                                $labelAlertTimer = 'badge bg-warning text-white';
                                if ($minutesDifference < $minutesTolerance) :
                                    $labelAlertTimer = 'badge bg-success text-white';
                                endif;
                                ?>

                                <div class="<?= $labelAlertTimer; ?>">
                                    <div id="time-down-counter-<?= $i; ?>"></div>
                                </div>

                                <?=
                                Yii2TimerCountDown::widget([
                                    'countDownIdSelector' => 'time-down-counter-' . $i,
                                    'countDownDate' => strtotime(date("Y-m-d H:i:s", $timeReference)) * 1000
                                ]);
                                ?>

                            </td>
                            <!-- ROOM -->
                            <td class="left">
                                <?php
                                    echo $scheduleItem->room->title.'<br>';
                                    foreach ($scheduleItem->scheduleDetails as $scheduleDetailItem) {
                                        echo $scheduleDetailItem->subject->title.'-'.$scheduleDetailItem->remark.'<br>';
                                    }
                                ?>
                            </td>
                            <td class="left">
                                <?php foreach ($scheduleItem->scheduleDetails as $scheduleDetailItem) {

                                    if (empty($scheduleDetailItem->asset_name)) {
                                        echo '<i>Asset not available</i>';
                                    } else {

                                        $textLink = '';
                                        $linkLabel = Yii::t('app', 'Closed');
                                        $labelClass = LabelHelper::getButtonCssPlus() . ' btn-sm disabled';

                                        if ($timeReference > $currentTime) :
                                            //http://www.mywebsite.com/presentation/index.html?USER_NAME=John&USER_EMAIL=john@ispringsolutions.com&ADDRESS=NYC
                                            $userinfo = '?USER_NAME=' . Yii::$app->user->identity->username .
                                                '&SCD=' . $scheduleDetailItem->id;
                                            $textLink = Yii::$app->urlManager->baseUrl .
                                                $scheduleDetailItem->asset_url . $userinfo;
                                            $linkLabel = Yii::t('app', 'Open');
                                            $labelClass = LabelHelper::getButtonCssPrint();
                                        endif;

                                        echo Html::a(
                                            $linkLabel,
                                            $textLink,
                                            ['class' => $labelClass]
                                        );
                                    }

                                } ?>
                            </td>
                        </tr>

                        <?php } ?>

                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
</div>

