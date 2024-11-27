<?php

use aneeshikmat\yii2\Yii2TimerCountDown\Yii2TimerCountDown;
use common\helper\DateHelper;
use common\helper\LabelHelper;
use common\service\CacheService;
use common\service\ScheduleDetailService;
use common\service\ScheduleService;
use yii\helpers\Html;


/** @var yii\web\View $this */
/** @var common\models\Schedule $listUpcomingSchedule */
/** @var common\models\Participant $participant */
/** @var common\service\ScheduleDetailService $scheduleDetailService */
/** @var frontend\models\TokenForm $tokenForm */

$this->title = Yii::$app->name;
?>


<div class="row">
    <div class="col-xs-6 col-sm-3 col-xl-3">
        <div class="card overflow-hidden rounded-2">
            <div class="card-body pt-3 p-2">
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

            <div class="card-body p-2">
                <?= $this->render('_form_token', [
                    'tokenForm' => $tokenForm,
                ])
                ?>
            </div>

        </div>
    </div>

    <div class="col-xs-6 col-sm-9 col-xl-9 d-flex align-items-stretch">
        <div class="card w-100">

            <?php
            $scheduleService = new ScheduleService();
            foreach ($listUpcomingSchedule as $i => $schedule) {
                $timeStart      = $schedule->getTimeStart();
                $timeOut        = $schedule->getTimeOut();
                $currentTime    = time();
                ?>
                <div class="card-body p-4">
                    <div class="mb-4">
                        <h5 class="card-title fw-semibold">
                            <?= '#' . $schedule->title; ?> / <?= DateHelper::formatDate($schedule->date_start) ?>
                            <span class="float-end float-right">
                                <?= $schedule->room->title; ?>
                            </span>
                        </h5>

                    </div>

                    <h5>
                        <small class="text-muted">
                            Start : <?= DateHelper::formatTime($schedule->date_start) ?>

                            <div class="<?= $scheduleService->getLabelAlertTimer($schedule); ?> float-end float-right">
                                <div id="time-down-counter-<?= $i; ?>"></div>
                            </div>

                            <?=
                            Yii2TimerCountDown::widget([
                                'countDownIdSelector' => 'time-down-counter-' . $i,
                                'countDownDate' => strtotime(date("Y-m-d H:i:s", $timeOut)) * 1000
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
                                <th><?= Yii::t('app', 'Question Type'); ?></th>
                                <th><?= Yii::t('app', 'Asset'); ?></th>
                                <th><?= Yii::t('app', 'Submission'); ?></th>
                            </tr>
                            </thead>

                            <tbody>
                            <?php foreach ($schedule->scheduleDetails as $j => $scheduleDetailItem) {
                                $assessment = $scheduleDetailService->getAssessment($scheduleDetailItem, $participant->id);
                                $isSubmitted = $scheduleDetailService->isParticipantSubmitted($assessment, $participant->id)
                                ?>
                                <tr>
                                    <td class="center"><?= ($j + 1); ?></td>
                                    <td class="left">
                                        <?= $scheduleDetailItem->subject->title; ?>
                                    </td>
                                    <td class="left">
                                        <?= $scheduleDetailItem->getOneQuestionType($scheduleDetailItem->question_type); ?>
                                    </td>
                                    <td class="left">
                                        <?php
                                        if($tokenForm->checkTokenToSchedule($schedule)){
                                            echo $scheduleDetailService->getAssetButton(
                                                $scheduleDetailItem,
                                                $isSubmitted,
                                                $participant->id,
                                                ScheduleDetailService::EXECUTE_ASSESSMENT_TRUE
                                            );
                                        } else {
                                            echo $tokenForm->getStatus($isSubmitted);
                                        }
                                        ?>
                                    </td>
                                    <td class="left">
                                        <?= $scheduleDetailService->getSubmissionStatus($assessment);?>
                                    </td>
                                </tr>

                            <?php } ?>

                            </tbody>
                        </table>
                    </div>
                </div>
            <?php } ?>

            <hr>

            <div class="card-body p-4">
                <h6><strong><?= LabelHelper::getNo(Yii::t('app', 'Recent')) ; ?></strong></h6>
                <table class="table table-striped table-sm">
                    <thead>
                    <tr>
                        <th class="center">#</th>
                        <th><?= Yii::t('app', 'Subject'); ?></th>
                        <th><?= Yii::t('app', 'Date'); ?></th>
                        <th><?= Yii::t('app', 'End'); ?></th>
                        <th><?= Yii::t('app', 'Room'); ?></th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php
                    foreach ($listRecentSchedule as $i => $schedule) {
                        ?>
                        <tr>
                            <td class="center">
                                <?= ($i+1) ?>
                            </td>
                            <td class="center">
                                <?php
                                echo Html::a($schedule->getSubjectsTitle(), ['schedule/view',
                                    'id' => $schedule->id,
                                    'title' => $schedule->title
                                ]);
                                ?>
                            </td>
                            <td class="left">
                                <?= DateHelper::formatDate($schedule->date_start); ?>
                            </td>
                            <td class="left">
                                <?= DateHelper::formatTime($schedule->date_end); ?>
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

