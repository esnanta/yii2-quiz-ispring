<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Period $model
 */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Period',
]) . ' ' . $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Periods'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>

<div class="panel panel-default">
    <div class="panel-heading">
        <div class="panel-title">
            <?=Yii::t('app', 'Please fill out the form below');?>
            <div class="float-right">
                <?=Yii::t('app', 'Period');?>
            </div>
        </div>
    </div>
    <div class="panel-body">
        <div class="period-update">
            <?= $this->render('_form', [
                'model' => $model,
                'officeList' => $officeList,
                'isActiveList' => $isActiveList
            ]) ?>
        </div>
    </div>
</div>



