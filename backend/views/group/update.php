<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Group $model
 */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Group',
]) . ' ' . $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Groups'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>

<div class="panel panel-default">
    <div class="panel-heading">
        <div class="panel-title">
            <?=Yii::t('app', 'Please fill out the form below');?>
            <div class="float-right">
                <?=Yii::t('app', 'Group');?>
            </div>
        </div>
    </div>
    <div class="panel-body">
        <div class="group-update">
            <?= $this->render('_form', [
                'model' => $model,
                'officeList' => $officeList
            ]) ?>
        </div>
    </div>
</div>



