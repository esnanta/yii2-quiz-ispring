<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Schedule */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Schedule',
]) . ' ' . $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Schedule'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>


<div class="card border-default mb-3">
    <div class="card-header">Please fill out the form below
        <span class="float-right">
            <?=Yii::t('app', 'Schedule');?>
        </span>
    </div>
    <div class="card-body text-default">
        <div class="schedule-create">
            <?= $this->render('_form', [
                'model' => $model,
                'subjectList' => $subjectList,
                'roomList' => $roomList,
                'groupList' => $groupList,
                'periodList' => $periodList,
                'staffList' => $staffList
            ])
            ?>
        </div>
    </div>
</div>
