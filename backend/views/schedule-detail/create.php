<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\ScheduleDetail $model
 */

$this->title = Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Schedule Detail',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Schedule Details'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="card border-default mb-3">
    <div class="card-header"><?=Yii::t('app', 'Please fill out the form below');?>
        <span class="float-right">
            <?=Yii::t('app', 'Schedule Detail');?>
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