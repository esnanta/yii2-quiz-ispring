<?php

use aneeshikmat\yii2\Yii2TimerCountDown\Yii2TimerCountDown;
use common\helper\LabelHelper;
use common\service\CacheService;
use common\service\DataIdService;
use yii\bootstrap5\Html;
use yii\helpers\Url;

/** @var yii\web\View $this */
/** @var common\models\Schedule $schedules */
/** @var common\models\Participant $participant */

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
                    <?= $participant->group->title; ?> <br>
                    <?= $participant->office->title; ?>

                    <?= CacheService::getInstance()->getOfficeIdByParticipant(); ?>
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
                    <span class="float-end float-right">

                    </span>
                </div>

                <?php
                foreach ($schedules as $i => $scheduleItem) {
                    $timer = $scheduleItem->getTimeReference();
                    ?>

                    <h5>
                        <?= $scheduleItem->title . ' / '; ?>
                        <small class="text-muted">
                            <?= $scheduleItem->room->title .' / ';?>
                            <?= $scheduleItem->date_start; ?>
                            <div class="<?= $scheduleItem->getLabelAlertTimer(); ?> float-end float-right">
                                <div id="time-down-counter-<?= $i; ?>"></div>
                            </div>
                            <?=
                            Yii2TimerCountDown::widget([
                                'countDownIdSelector' => 'time-down-counter-' . $i,
                                'countDownDate' => strtotime(date("Y-m-d H:i:s", $timer)) * 1000
                            ]);
                            ?>
                        </small>
                    </h5>

                    <div class="table-responsive-sm">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th class="center">#</th>
                                <th><?= Yii::t('app', 'Subject'); ?></th>
                                <th><?= Yii::t('app', 'Asset'); ?></th>
                            </tr>
                            </thead>

                            <tbody>
                            <?php foreach ($scheduleItem->scheduleDetails as $j=>$scheduleDetailItem) { ?>
                                <tr>
                                    <td class="center"><?= ($j + 1); ?></td>
                                    <td class="left">
                                        <?= $scheduleDetailItem->remark; ?>
                                    </td>
                                    <td class="left">
                                        <?= $scheduleDetailItem->getAssetButton($participant->id); ?>
                                    </td>
                                </tr>

                            <?php } ?>

                            </tbody>
                        </table>
                    </div>

                <?php } ?>


            </div>
        </div>
    </div>
</div>

