<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var backend\models\Subject $model
 */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Subject',
]) . ' ' . $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Subjects'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>

<div class="panel panel-default">
    <div class="panel-heading">
        <div class="panel-title">
            Please fill out the form below
            <div class="pull-right">
                Subject            </div>
        </div>
    </div>
    <div class="panel-body">
        <div class="subject-update">
            <?= $this->render('_form', [
                'model' => $model,
                'officeList' => $officeList
            ]) ?>
        </div>
    </div>
</div>



