<?php

use aneeshikmat\yii2\Yii2TimerCountDown\Yii2TimerCountDown;
use common\helper\DateHelper;
use common\service\ScheduleDetailService;
use yii\helpers\Html;


/** @var yii\web\View $this */
/** @var common\models\Schedule[] $listOngoingSchedule */
/** @var common\models\Schedule[] $listUpcomingSchedule */
/** @var common\models\Schedule[] $listCompletedSchedule */
/** @var common\models\Profile $profile */
/** @var ScheduleDetailService $scheduleDetailService */

$this->title = Yii::$app->name;
?>

<div class="row">
    <div class="col-12">
        <!-- ONGOING SCHEDULES -->
        <div class="card">
            <div class="card-header bg-success text-white">
                <h4 class="card-title mb-0 text-white">
                    <i class="fas fa-play-circle me-2"></i> <?= Yii::t('app', 'Ongoing Schedules') ?>
                </h4>
            </div>
            <div class="card-body">
                <?php if (empty($listOngoingSchedule)): ?>
                    <div class="alert alert-info text-center">
                        <i class="fas fa-info-circle me-2"></i>
                        <?= Yii::t('app', 'No ongoing schedules at the moment.') ?>
                    </div>
                <?php else: ?>
                    <div class="accordion" id="ongoingSchedulesAccordion">
                        <?php foreach ($listOngoingSchedule as $i => $schedule):
                            $timeOut = $schedule->getTimeOut();
                            ?>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="heading-ongoing-<?= $schedule->id ?>">
                                    <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                            data-bs-target="#collapse-ongoing-<?= $schedule->id ?>" aria-expanded="true"
                                            aria-controls="collapse-ongoing-<?= $schedule->id ?>">
                                        <span class="fw-bold me-2"><?= Html::encode($schedule->title) ?></span>
                                        <span class="text-muted me-auto"><?= DateHelper::formatDate($schedule->date_start) ?></span>
                                        <span class="badge bg-primary me-2"><i class="fas fa-door-open me-1"></i> <?= Html::encode($schedule->room->title) ?></span>
                                    </button>
                                </h2>
                                <div id="collapse-ongoing-<?= $schedule->id ?>" class="accordion-collapse collapse show"
                                     aria-labelledby="heading-ongoing-<?= $schedule->id ?>"
                                     data-bs-parent="#ongoingSchedulesAccordion">
                                    <div class="accordion-body">
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <div>
                                                <i class="fas fa-clock text-muted me-1"></i>
                                                <small class="text-muted">
                                                    <?= Yii::t('app', 'Started at {time}', ['time' => DateHelper::formatTime($schedule->date_start)]) ?>
                                                </small>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <small class="text-danger me-2"><?= Yii::t('app', 'Ends in:') ?></small>
                                                <div class="badge bg-danger">
                                                    <div id="time-down-counter-ongoing-<?= $i ?>"></div>
                                                </div>
                                                <?= Yii2TimerCountDown::widget([
                                                    'countDownIdSelector' => 'time-down-counter-ongoing-' . $i,
                                                    'countDownDate' => $timeOut * 1000,
                                                ]); ?>
                                            </div>
                                        </div>
                                        <div class="table-responsive">
                                            <table class="table table-hover">
                                                <thead class="table-light">
                                                <tr>
                                                    <th>#</th>
                                                    <th><?= Yii::t('app', 'Subject'); ?></th>
                                                    <th><?= Yii::t('app', 'Question Type'); ?></th>
                                                    <th><?= Yii::t('app', 'Submission'); ?></th>
                                                    <th class="text-center"><?= Yii::t('app', 'Action'); ?></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <?php foreach ($schedule->scheduleDetails as $j => $scheduleDetailItem):
                                                    $assessment = $scheduleDetailService->getAssessment($scheduleDetailItem, $profile->user_id);
                                                    ?>
                                                    <tr>
                                                        <td><?= ($j + 1); ?></td>
                                                        <td><?= Html::encode($scheduleDetailItem->subject->title); ?></td>
                                                        <td><?= $scheduleDetailItem->getOneQuestionType($scheduleDetailItem->question_type); ?></td>
                                                        <td><?= $scheduleDetailService->getSubmissionStatus($assessment); ?></td>
                                                        <td class="text-center">
                                                            <?= Html::a('<i class="fas fa-sign-in-alt me-1"></i> ' . Yii::t('app', 'Open'), ['schedule/view', 'id' => $schedule->id], ['class' => 'btn btn-primary btn-sm']); ?>
                                                        </td>
                                                    </tr>
                                                <?php endforeach; ?>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <?php endforeach; ?>
                    </div>
                <?php endif; ?>
            </div>
        </div>

        <!-- UPCOMING SCHEDULES -->
        <div class="card mt-4">
            <div class="card-header">
                <h4 class="card-title mb-0">
                    <i class="fas fa-calendar-alt me-2"></i> <?= Yii::t('app', 'Upcoming Schedules') ?>
                </h4>
            </div>
            <div class="card-body">
                <?php if (empty($listUpcomingSchedule)): ?>
                    <div class="alert alert-info text-center">
                        <i class="fas fa-info-circle me-2"></i>
                        <?= Yii::t('app', 'No upcoming schedules found.') ?>
                    </div>
                <?php else: ?>
                    <div class="accordion" id="upcomingSchedulesAccordion">
                        <?php foreach ($listUpcomingSchedule as $i => $schedule): ?>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="heading-upcoming-<?= $schedule->id ?>">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                            data-bs-target="#collapse-upcoming-<?= $schedule->id ?>" aria-expanded="false"
                                            aria-controls="collapse-upcoming-<?= $schedule->id ?>">
                                        <span class="fw-bold me-2"><?= Html::encode($schedule->title) ?></span>
                                        <span class="text-muted me-auto"><?= DateHelper::formatDate($schedule->date_start) ?></span>
                                        <span class="badge bg-primary me-2"><i class="fas fa-door-open me-1"></i> <?= Html::encode($schedule->room->title) ?></span>
                                    </button>
                                </h2>
                                <div id="collapse-upcoming-<?= $schedule->id ?>" class="accordion-collapse collapse"
                                     aria-labelledby="heading-upcoming-<?= $schedule->id ?>"
                                     data-bs-parent="#upcomingSchedulesAccordion">
                                    <div class="accordion-body">
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <div>
                                                <i class="fas fa-clock text-muted me-1"></i>
                                                <small class="text-muted">
                                                    <?= Yii::t('app', 'Starts at {time}', ['time' => DateHelper::formatTime($schedule->date_start)]) ?>
                                                </small>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <small class="text-primary me-2"><?= Yii::t('app', 'Countdown:') ?></small>
                                                <div class="badge bg-primary">
                                                    <div id="time-down-counter-upcoming-<?= $i ?>"></div>
                                                </div>
                                                <?= Yii2TimerCountDown::widget([
                                                    'countDownIdSelector' => 'time-down-counter-upcoming-' . $i,
                                                    'countDownDate' => strtotime($schedule->date_start) * 1000,
                                                ]); ?>
                                            </div>
                                        </div>
                                        <div class="table-responsive">
                                            <table class="table table-hover">
                                                <thead class="table-light">
                                                <tr>
                                                    <th>#</th>
                                                    <th><?= Yii::t('app', 'Subject'); ?></th>
                                                    <th><?= Yii::t('app', 'Question Type'); ?></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <?php foreach ($schedule->scheduleDetails as $j => $scheduleDetailItem): ?>
                                                    <tr>
                                                        <td><?= ($j + 1); ?></td>
                                                        <td><?= Html::encode($scheduleDetailItem->subject->title); ?></td>
                                                        <td><?= $scheduleDetailItem->getOneQuestionType($scheduleDetailItem->question_type); ?></td>
                                                    </tr>
                                                <?php endforeach; ?>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <?php endforeach; ?>
                    </div>
                <?php endif; ?>
            </div>
        </div>

        <!-- COMPLETED SCHEDULES -->
        <div class="card mt-4">
            <div class="card-header">
                <h4 class="card-title mb-0">
                    <i class="fas fa-history me-2"></i> <?= Yii::t('app', 'Completed Schedules') ?>
                </h4>
            </div>
            <div class="card-body">
                <?php if (empty($listCompletedSchedule)): ?>
                    <div class="alert alert-info text-center">
                        <i class="fas fa-info-circle me-2"></i>
                        <?= Yii::t('app', 'No completed schedules found.') ?>
                    </div>
                <?php else: ?>
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead class="table-light">
                        <tr>
                            <th>#</th>
                            <th><?= Yii::t('app', 'Subject'); ?></th>
                            <th><?= Yii::t('app', 'Date'); ?></th>
                            <th><?= Yii::t('app', 'End Time'); ?></th>
                            <th><?= Yii::t('app', 'Room'); ?></th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php foreach ($listCompletedSchedule as $i => $schedule): ?>
                            <tr>
                                <td><?= ($i + 1) ?></td>
                                <td>
                                    <?= Html::a(Html::encode($schedule->getSubjectsTitle()), ['schedule/view',
                                        'id' => $schedule->id,
                                        'title' => $schedule->title
                                    ]); ?>
                                </td>
                                <td><?= DateHelper::formatDate($schedule->date_start); ?></td>
                                <td><?= DateHelper::formatTime($schedule->date_end); ?></td>
                                <td><?= Html::encode($schedule->room->title); ?></td>
                            </tr>
                        <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
                <?php endif; ?>
            </div>
        </div>
    </div>
</div>
