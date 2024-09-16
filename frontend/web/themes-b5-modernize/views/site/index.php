<?php

use aneeshikmat\yii2\Yii2TimerCountDown\Yii2TimerCountDown;
use common\helper\DateHelper;
use common\helper\LabelHelper;
use common\service\CacheService;
use common\service\DataIdService;
use yii\bootstrap5\Html;
use yii\helpers\Url;

/** @var yii\web\View $this */
/** @var common\models\Schedule $schedules */
/** @var common\models\Participant $participant */
/** @var common\service\ScheduleDetailService $scheduleDetailService */
/** @var frontend\models\TokenForm $tokenForm */

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
                <?= $this->render('_form_token', [
                    'tokenForm' => $tokenForm,
                ])
                ?>
            </div>

            <?php
            foreach ($schedules as $i => $scheduleItem) {
                $timer = $scheduleItem->getTimeReference();
                ?>
                <div class="card-body p-4">
                    <div class="mb-4">
                        <h5 class="card-title fw-semibold">
                            <?= Yii::t('app', 'Schedule') . ' #' . $scheduleItem->title; ?>
                            <span class="float-end float-right">
                                <?= $scheduleItem->room->title; ?>
                            </span>
                        </h5>

                    </div>

                    <h5>
                        <small class="text-muted">
                            Start : <?= DateHelper::formatDateTime($scheduleItem->date_start) ?>
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
                                <th><?= Yii::t('app', 'Question Type'); ?></th>
                                <th><?= Yii::t('app', 'Submission'); ?></th>
                                <th><?= Yii::t('app', 'Asset'); ?></th>
                            </tr>
                            </thead>

                            <tbody>
                            <?php foreach ($scheduleItem->scheduleDetails as $j => $scheduleDetailItem) {
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
                                        <?= $scheduleDetailService->getSubmissionStatus($assessment);?>
                                    </td>
                                    <td class="left">
                                        <?php
                                            if($tokenForm->checkTokenToSchedule($scheduleItem)){
                                                echo $scheduleDetailService->getAssetButton($scheduleDetailItem, $isSubmitted, $participant->id);
                                            } else {
                                                echo $tokenForm->getStatus($isSubmitted);
                                            }
                                        ?>
                                    </td>
                                </tr>

                            <?php } ?>

                            </tbody>
                        </table>
                    </div>


                </div>
            <?php } ?>
        </div>
    </div>
</div>

