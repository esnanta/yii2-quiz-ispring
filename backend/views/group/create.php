<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Group $model
 */

$this->title = Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Group',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Groups'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="card border-default mb-3">
    <div class="card-header">Please fill out the form below 
        <span class="float-right">
            Group        </span>
    </div>
    <div class="card-body text-default">
        <div class="group-create">
            <?= $this->render('_form', [
                'model' => $model,
                'officeList' => $officeList
            ]) 
            ?>
        </div>
    </div>
</div>