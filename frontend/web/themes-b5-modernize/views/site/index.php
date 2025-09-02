<?php
use common\helper\DateHelper;
use common\helper\LabelHelper;
use common\helper\ApexChartHelper;
use yii\bootstrap5\Html;
use yii\helpers\Url;

/** @var yii\web\View $this */
/** @var common\models\Schedule $listUpcomingSchedule */
/** @var common\models\Schedule $listRecentSchedule */
/** @var array $assessmentStats */
/** @var array $categories */
/** @var array $series */
/** @var common\models\Profile $profile */

$this->title = Yii::$app->name;
?>

<div class="row">
    <!-- Dashboard Summary -->
    <div class="col-md-8 col-xs-12">
        <div class="card border-default mb-3">
            <div class="card-header">
                <?= Yii::t('app', 'Student Dashboard'); ?>
                <span class="float-right float-end">
                    <?= $profile ? $profile->name : ''; ?>
                </span>
            </div>
            <div class="card-body text-default">
                <!-- Summary Cards -->
                <div class="row mb-3">
                    <div class="col-md-4">
                        <div class="card text-center">
                            <div class="card-body">
                                <h6><?= Yii::t('app', 'Total Assessments'); ?></h6>
                                <h3><?= $assessmentStats['total'] ?? '-' ?></h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card text-center">
                            <div class="card-body">
                                <h6><?= Yii::t('app', 'Average Score'); ?></h6>
                                <h3><?= $assessmentStats['average_score'] ?? '-' ?></h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card text-center">
                            <div class="card-body">
                                <h6><?= Yii::t('app', 'Passed'); ?></h6>
                                <h3 class="text-success"><?= $assessmentStats['passed'] ?? '-' ?></h3>
                                <h6><?= Yii::t('app', 'Failed'); ?>: <span class="text-danger"><?= $assessmentStats['failed'] ?? '-' ?></span></h6>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Charts Section -->
                <div class="row mb-3">
                    <div class="col-md-6">
                        <div class="card h-100">
                            <div class="card-header text-center">
                                <?= Yii::t('app', 'Average Time Used vs Available'); ?>
                            </div>
                            <div class="card-body p-2">
                                <?php
                                $used = $assessmentStats['average_used_time'] ?? 0;
                                $limit = $assessmentStats['average_time_limit'] ?? 0;
                                $remaining = $limit > $used ? $limit - $used : 0;
                                $pieLabels = [
                                    Yii::t('app', 'Average Time Used') . " ({$used})",
                                    Yii::t('app', 'Average Time Remaining') . " ({$remaining})"
                                ];
                                $pieSeries = [$used, $remaining];
                                echo ApexChartHelper::renderPieChart($pieLabels, $pieSeries, Yii::t('app', 'Average Time Used vs Available'));
                                ?>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card h-100">
                            <div class="card-header text-center">
                                <?= Yii::t('app', 'Exam Type Distribution'); ?>
                            </div>
                            <div class="card-body p-2">
                                <?php
                                if (!empty($assessmentStats['exam_type_labels']) && !empty($assessmentStats['exam_type_counts'])) {
                                    echo ApexChartHelper::renderBarChart(
                                        $assessmentStats['exam_type_labels'],
                                        $assessmentStats['exam_type_counts'],
                                        Yii::t('app', 'Exam Type Distribution')
                                    );
                                }
                                ?>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Score Charts Section -->
                <div class="mb-3">
                    <?php
                    if ($series && $categories) {
                        echo ApexChartHelper::renderParticipantScoreChart(
                            $categories, $series, Yii::t('app', 'Your Scores')
                        );
                        echo '<br>';
                        echo ApexChartHelper::renderRadarChart(
                            $categories, $series, Yii::t('app', 'Evaluation vs Average')
                        );
                    } else {
                        echo '<div class="alert alert-info">'.Yii::t('app', 'No assessment data available.').'</div>';
                    }
                    ?>
                </div>
            </div>
        </div>
    </div>

    <!-- Sidebar: Calendar & Schedules -->
    <div class="col-md-4 col-xs-12">
        <div class="card border-default mb-3">
            <div class="card-header">
                <?= Yii::t('app', 'Schedule Overview'); ?>
            </div>
            <div class="card-body text-default">
                <div id="calendar"></div>
                <hr>
                <div class="accordion mb-2" id="scheduleAccordion">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingUpcoming">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseUpcoming" aria-expanded="true" aria-controls="collapseUpcoming">
                                <?= LabelHelper::getYes(Yii::t('app', 'Upcoming')) ; ?>
                            </button>
                        </h2>
                        <div id="collapseUpcoming" class="accordion-collapse collapse show" aria-labelledby="headingUpcoming" data-bs-parent="#scheduleAccordion">
                            <div class="accordion-body p-0">
                                <ul class="list-group">
                                    <?php foreach (array_slice($listUpcomingSchedule, 0, 5) as $schedule) { ?>
                                        <li class="list-group-item">
                                            <strong><?= Html::a($schedule->getSubjectsTitle(), ['schedule/index']);?></strong>
                                            <br>
                                            <?= DateHelper::formatDate($schedule->date_start); ?>,
                                            <?= DateHelper::formatTime($schedule->date_start); ?>,
                                            <?= $schedule->room->title; ?>
                                        </li>
                                    <?php } ?>
                                    <?php if (count($listUpcomingSchedule) > 5): ?>
                                        <li class="list-group-item text-center">
                                            <em><?= Yii::t('app', 'Showing 5 of ') . count($listUpcomingSchedule) . ' ' . Yii::t('app', 'records'); ?></em>
                                        </li>
                                    <?php endif; ?>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingRecent">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseRecent" aria-expanded="false" aria-controls="collapseRecent">
                                <?= LabelHelper::getNo(Yii::t('app', 'Recent')) ; ?>
                            </button>
                        </h2>
                        <div id="collapseRecent" class="accordion-collapse collapse" aria-labelledby="headingRecent" data-bs-parent="#scheduleAccordion">
                            <div class="accordion-body p-0">
                                <ul class="list-group">
                                    <?php foreach (array_slice($listRecentSchedule, 0, 5) as $schedule) { ?>
                                        <li class="list-group-item">
                                            <strong><?= Html::a($schedule->getSubjectsTitle(), ['schedule/index']);?></strong>
                                            <br>
                                            <?= DateHelper::formatDate($schedule->date_start); ?>,
                                            <?= DateHelper::formatTime($schedule->date_start); ?>,
                                            <?= $schedule->room->title; ?>
                                        </li>
                                    <?php } ?>
                                    <?php if (count($listRecentSchedule) > 5): ?>
                                        <li class="list-group-item text-center">
                                            <em><?= Yii::t('app', 'Showing 5 of ') . count($listRecentSchedule) . ' ' . Yii::t('app', 'records'); ?></em>
                                        </li>
                                    <?php endif; ?>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

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
        timeFormat: 'H:mm',
        eventClick: function(event) {
            if (event.url) {
                window.location.href = event.url;
                return false;
            }
        }
    });
");
?>
