<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var backend\models\Room $model
 */

$this->title = Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Room',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Rooms'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="card border-default mb-3">
    <div class="card-header">Please fill out the form below 
        <span class="pull-right">
            Room        </span>
    </div>
    <div class="card-body text-default">
        <div class="room-create">
            <?= $this->render('_form', [
                'model' => $model,
                'officeList' => $officeList
            ]) 
            ?>
        </div>
    </div>
</div>