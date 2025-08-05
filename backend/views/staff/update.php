<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Staff $model
 */

$this->title = 'Update Staff: ' . ' ' . $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Staff', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>

<div class="card border-default mb-3">
    <div class="card-header">
        <?= Yii::t('app', 'Please fill out the form below'); ?>
        <span class="float-right">
            <?= Html::encode($this->title) ?>
        </span>
    </div>
    <div class="card-body text-default">
        <?= $this->render('_form', [
            'model' => $model,
            'officeList' => $officeList,
            'employmentList' => $employmentList,
            'genderList' => $genderList,
            'activeStatusList' => $activeStatusList
        ])
        ?>
    </div>
</div>