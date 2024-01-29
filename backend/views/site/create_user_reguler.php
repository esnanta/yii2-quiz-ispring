<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Fuel $model
 */

$this->title = Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Owner',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Staff'), 'url' => ['staff/index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="card border-default mb-3">
    <div class="card-header">Please fill out the form below <span class="pull-right"><?=$this->title;?></span></div>
    <div class="card-body text-default">
        <div class="fuel-create">

            <?= $this->render('_form_user_reguler', [
                'model' => $model,
                'employmentList' => $employmentList,
                'userTypeList' => $userTypeList,
            ]) 
            ?>
        </div>

    </div>
</div>