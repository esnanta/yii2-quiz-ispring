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

<div class="panel panel-default">
    <div class="panel-heading">
        <div class="panel-title">
            Please fill out the form below
            <div class="float-right">
                <?=Yii::t('app', 'Schedule');?>
            </div>
        </div>
    </div>
    <div class="panel-body">
        <div class="schedule-update">
            <?= $this->render('_form', [
                'model' => $model,
                'subjectList' => $subjectList,
                'roomList' => $roomList,
                'groupList' => $groupList,
                'periodList' => $periodList
            ]) ?>
        </div>
    </div>
</div>
