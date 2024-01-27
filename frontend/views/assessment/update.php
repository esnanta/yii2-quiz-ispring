<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Assessment */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Assessment',
]) . ' ' . $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Assessment'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>

<div class="panel panel-default">
    <div class="panel-heading">
        <div class="panel-title">
            Please fill out the form below
            <div class="pull-right">
                Assessment            </div>
        </div>
    </div>
    <div class="panel-body">
        <div class="assessment-update">
            <?= $this->render('_form', [
                'model' => $model,
                'scheduleList' => $scheduleList,
            ]) ?>
        </div>
    </div>
</div>
