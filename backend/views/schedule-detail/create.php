<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var backend\models\ScheduleDetail $model
 */

$this->title = Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Schedule Detail',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Schedule Details'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="card border-default mb-3">
    <div class="card-header">Please fill out the form below
        <span class="pull-right">
            ScheduleDetail
        </span>
    </div>
    <div class="card-body text-default">
        <div class="schedule-detail-create">
            <?= $this->render('_form', [
                'model' => $model,
                'scheduleList' => $scheduleList,
                'subjectList' => $subjectList
            ])
            ?>
        </div>
    </div>
</div>