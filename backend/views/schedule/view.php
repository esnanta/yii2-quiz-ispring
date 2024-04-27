<?php

use aneeshikmat\yii2\Yii2TimerCountDown\Yii2TimerCountDown;
use common\helper\LabelHelper;
use common\models\Schedule;
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Schedule */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Schedule'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$create = Html::a(
    '<i class="fas fa-plus"></i>',
    ['create'],
    ['class' => 'button float-right', 'style' => 'color:#333333;padding:0 5px']
);
?>


<?php
    $timeStart          = strtotime($model->date_start);
    $timeOut            = strtotime($model->date_end);
    $tokenTime          = strtotime($model->token_time);
    $currentTime        = strtotime("now");
    $countdownTime      = strtotime($model->date_start);
    $interval           = (int)(abs(($currentTime-$timeStart) / 60));
    $minutesTolerance   = 15; //minutes

    //FIRST TOKEN START 2 MINUTES EARLY FROM DATE_START
    if($currentTime <= $timeStart) {
        // Decrease 2 minutes from current time
        $countdownTime      = $timeStart - (2 * 60);
        $interval           = (int)(abs(($timeStart - $countdownTime) / 60));
        $model->token_time  = date(Yii::$app->params['datetimeSaveFormat']);
        $model->token       = substr(uniqid('', true), -6);
        $model->save();
    } else {
        //START NEW TOKEN
        if($currentTime < $timeOut){
            $interval = (int)(abs(($currentTime-$tokenTime) / 60));
            if ($interval >= $minutesTolerance) :
                $schedule = Schedule::findOne(['id' => $model->id,'office_id'=>$model->office_id]);
                if($model->token_time < $schedule->token_time) {
                    $model = $schedule;
                } else {
                    $model->token_time = date(Yii::$app->params['datetimeSaveFormat']);
                    $model->token = substr(uniqid('', true), -6);
                    $model->save();
                }
            endif;
            $countdownTime = strtotime($model->token_time) + ($minutesTolerance * 60);
        }
    }

    $labelAlertTimer = 'badge bg-warning text-white';
    if ($interval < $minutesTolerance) :
        $labelAlertTimer = 'badge bg-success text-white';
    endif;

?>

<?php
    Yii2TimerCountDown::widget([
        'countDownIdSelector' => 'time-down-counter-token',
        'countDownDate' => $countdownTime * 1000
    ]);
?>

<div class="card">
    <div class="card-header">

        <?= Yii::t('app', 'Schedule') ?>
        <strong> #<?= $model->title;?></strong> /
        Token : <strong><?=$model->token;?></strong> /
        <div class="<?= $labelAlertTimer;?>">
            <div id="time-down-counter-token"></div>
        </div>

        <div class="float-right">
            <?=
            Html::a(
                '<i class="fas fa-plus"></i> New',
                ['create'],
                ['class' => LabelHelper::getButtonCssPlus()]
            );
            ?>
            <?=
            Html::a(
                '<i class="fas fa-pencil-alt"></i> Update',
                ['update', 'id' => $model->id],
                ['class' => LabelHelper::getButtonCssUpdate()]
            );
            ?>
            <?=
            Html::a('<i class="fas fa-minus"></i> Delete', ['delete', 'id' => $model->id], [
                'class' => LabelHelper::getButtonCssMinus(),
                'data' => [
                    'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                    'method' => 'post',
                ],
            ]);
            ?>
            <button class="<?= LabelHelper::getButtonCssPrint() ?>" type="button" onclick="window.print();">
                <i class="fas fa-print"></i>
                Print
            </button>
        </div>
    </div>

    <div class="card-body">
        <div class="row mb-4">

            <div class="col-sm-4">
                <h6 class="mb-3"><?= Yii::t('app', 'Office'); ?>:</h6>
                <div><strong><?= $model->office->title; ?></strong></div>
                <div><?= $model->office->address; ?></div>
                <div>Email: <?= $model->office->email; ?></div>
                <div>Phone: <?= $model->office->phone_number; ?></div>
            </div>


            <div class="col-sm-4">
                <h6 class="mb-3"><?= Yii::t('app', 'Details') ?>:</h6>
                <div>
                    <strong><?= $model->period->title; ?></strong>
                </div>
                <div></div>
                <div><?= $model->group->title; ?></div>
                <div><?= $model->room->title; ?></div>
            </div>

            <div class="col-sm-4">
                <h6 class="mb-3"><?= Yii::t('app', 'Time') ?>:</h6>
                <div><?= Yii::t('app', 'Date Start'); ?> : <?= $model->date_start; ?></div>
                <div><?= Yii::t('app', 'Date End'); ?> : <?= $model->date_end; ?></div>
            </div>

        </div>

        <?php if ($providerScheduleDetail->totalCount) { ?>

            <div class="table-responsive-sm">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th class="center">#</th>
                        <th><?= Yii::t('app', 'Subject'); ?></th>
                        <th><?= Yii::t('app', 'Remark'); ?></th>
                        <th class="center"><?= Yii::t('app', 'Asset'); ?></th>
                        <th class="right"><?= Yii::t('app', ''); ?></th>
                    </tr>
                    </thead>
                    <tbody>

                    <?php
                    $modelDetails = $providerScheduleDetail->getModels();
                    foreach ($modelDetails as $i => $modelDetailItem) {
                        ?>

                        <tr>
                            <td class="center"><?= ($i + 1); ?></td>
                            <td class="left"><?= $modelDetailItem->subject->title; ?></td>
                            <td class="left"><?= $modelDetailItem->remark; ?></td>
                            <td class="center">
                                <?php
                                if (empty($modelDetailItem->asset_name)) {
                                    echo Yii::t('app', 'Please upload files in zip');
                                } else {
                                    $textLink = Yii::$app->urlManager->baseUrl . $modelDetailItem->asset_url;
                                    echo Html::a(
                                        'Open',
                                        str_replace('admin', 'frontend/web', $textLink),
                                        ['class' => LabelHelper::getButtonCssPlus()]
                                    );
                                }
                                ?></td>
                            <td class="right">
                                <?php
                                if ($modelDetailItem->asset_name == null) {
                                    echo Html::a(
                                        '<i class="fas fa-upload"></i>',
                                        ['schedule-detail/update', 'id' => $modelDetailItem->id],
                                        ['class' => LabelHelper::getButtonCssPlus()]
                                    );
                                } else {
                                    echo Html::a('<i class="fas fa-trash-alt"></i>',
                                        ['schedule-detail/delete-file', 'id' => $modelDetailItem->id], [
                                            'class' => LabelHelper::getButtonCssMinus(),
                                            'data' => [
                                                'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                                                'method' => 'post',
                                            ],
                                        ]);
                                }
                                ?>
                            </td>
                        </tr>

                    <?php } ?>

                    </tbody>
                </table>
            </div>

        <?php } ?>


        <div class="row">
            <div class="col-lg-4 col-sm-5">
                <?= Yii::t('app', 'Created At'); ?>:
                <?= date(Yii::$app->params['dateDisplayFormat'], strtotime($model->created_at)); ?>
                <br><?= Yii::t('app', 'Created By'); ?> :
                <?= \common\models\User::getName($model->created_by); ?>
            </div>
            <div class="col-lg-4 col-sm-5 ml-auto">
                <?= Yii::t('app', 'Description'); ?>:
                <br><?= ($model->description == null) ? '-' : $model->description; ?>

            </div>
        </div>
    </div>
</div>


<p id="countdown"></p>

<script>
    var maxTime = 50000; // Time in milliseconds (50 seconds)
    var timeLeft = maxTime;
    var countdownElement = document.getElementById('countdown');

    function updateCountdown() {
        timeLeft -= 1000; // Decrement every second (1000 milliseconds)
        var seconds = Math.floor(timeLeft / 1000); // Get remaining seconds

        // Update paragraph content with formatted time
        countdownElement.textContent = "Form will submit in " + seconds + " seconds";

        if (timeLeft <= 0) {
            clearTimeout(timeoutId); // Clear timeout when time runs out
            postFormFunction();
        } else {
            // Call updateCountdown again after 1 second for continuous update
            timeoutId = setTimeout(updateCountdown, 1000);
        }
    }

    var timeoutId = setTimeout(updateCountdown, 1000); // Start countdown immediately
</script>