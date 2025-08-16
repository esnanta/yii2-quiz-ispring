<?php

use aneeshikmat\yii2\Yii2TimerCountDown\Yii2TimerCountDown;
use common\helper\DateHelper;
use common\helper\LabelHelper;
use yii\helpers\Html;
use kartik\detail\DetailView;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var common\models\ScheduleToken $model
 * @var int $countdownTime
 * @var int $interval
 * @var string $labelAlertTimer
 * @var string $tokenMessage
 * @var string $status
 */

$this->title = 'Current Token ' . $model->token;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Schedule Tokens'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$create = LabelHelper::getCreateButton();

$refresh = Html::a(
        '<i class="fas fa-sync-alt"></i> Refresh',
        ['view', 'id' => $model->id],
        ['class' => 'btn btn-sm btn-primary float-right float-end']
);

// Setup countdown timer
Yii2TimerCountDown::widget([
        'countDownIdSelector' => 'schedule-token-countdown',
        'countDownDate' => $countdownTime * 1000
]);

?>

<div class="schedule-token-view">

    <!-- Token Status Card -->
    <div class="card mb-3">
        <div class="card-header">
            <h5><?= Yii::t('app', 'Token Status') ?></h5>
            <?= $refresh ?>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-3">
                    <strong><?= Yii::t('app', 'Current Token') ?>:</strong><br>
                    <span class="h3 text-primary">
                        <?= $status === 'expired' ? '-' : ($model->token ?: 'Not Generated') ?>
                    </span>
                </div>
                <div class="col-md-3">
                    <strong><?= Yii::t('app', 'Status') ?>:</strong><br>
                    <span class="<?= $labelAlertTimer ?>">
                        <?php
                        switch($status) {
                            case 'waiting':
                                echo Yii::t('app', 'Waiting to Start');
                                break;
                            case 'active':
                                echo Yii::t('app', 'Active');
                                break;
                            case 'expired':
                                echo Yii::t('app', 'Expired');
                                break;
                        }
                        ?>
                    </span>
                </div>
                <div class="col-md-3">
                    <strong>
                        <?php
                        if ($status === 'waiting') {
                            echo Yii::t('app', 'Starts in');
                        } elseif ($status === 'active') {
                            echo Yii::t('app', 'Next token in');
                        } else {
                            echo Yii::t('app', 'Timer');
                        }
                        ?>:
                    </strong><br>
                    <div class="<?= $labelAlertTimer ?>">
                        <div id="schedule-token-countdown"></div>
                    </div>
                </div>
                <div class="col-md-3">
                    <strong><?= Yii::t('app', 'Message') ?>:</strong><br>
                    <?= $tokenMessage ?>
                </div>
            </div>

            <?php if ($status === 'active'): ?>
                <div class="row mt-3">
                    <div class="col-12">
                        <div class="alert alert-info">
                            <i class="fas fa-info-circle"></i>
                            <?= Yii::t('app', 'Token changes every 15 minutes during the active period') ?>
                        </div>
                    </div>
                </div>
            <?php endif; ?>
        </div>
    </div>

    <!-- Schedule Token Details -->
    <?= DetailView::widget([
            'model' => $model,
            'condensed' => false,
            'hover' => true,
            'mode' => Yii::$app->request->get('edit') == 't' ? DetailView::MODE_EDIT : DetailView::MODE_VIEW,
            'panel' => [
                    'heading' => $this->title . $create,
                    'type' => DetailView::TYPE_DEFAULT,
            ],
            'attributes' => [
                    [
                            'attribute' => 'date_start',
                            'type' => DetailView::INPUT_WIDGET,
                            'widgetOptions' => [
                                    'class' => DateControl::class,
                                    'type' => DateControl::FORMAT_DATETIME
                            ]
                    ],
                    [
                            'attribute' => 'date_end',
                            'type' => DetailView::INPUT_WIDGET,
                            'widgetOptions' => [
                                    'class' => DateControl::class,
                                    'type' => DateControl::FORMAT_DATETIME
                            ]
                    ],
                    [
                            'attribute' => 'token_time',
                            'type' => DetailView::INPUT_WIDGET,
                            'widgetOptions' => [
                                    'class' => DateControl::class,
                                    'type' => DateControl::FORMAT_DATETIME
                            ]
                    ],
                    'token',
                    'description'
            ],
            'deleteOptions' => [
                    'url' => ['delete', 'id' => $model->id],
            ],
            'enableEditMode' => true,
    ]) ?>

</div>