<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var backend\models\Theme $model
 */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Theme',
]) . ' ' . $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Themes'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>


<div class="panel panel-default">
    <div class="panel-heading">
        <div class="panel-title">
            Please fill out the form below
            <div class="pull-right">
                Theme            </div>            
        </div>
    </div>
    <div class="panel-body">

        <div class="theme-update">

            <?= $this->render('_form', [
                'model' => $model,
                'officeList'=>$officeList,
                'themTypeList'=>$themTypeList
            ]) ?>

        </div>
        
    </div>
</div>



