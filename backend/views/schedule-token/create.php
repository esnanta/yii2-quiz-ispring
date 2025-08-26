<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\ScheduleToken $model
 */

$this->title = Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Schedule Token',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Schedule Tokens'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="card border-default mb-3">
    <div class="card-header">Please fill out the form below 
        <span class="pull-right">
            ScheduleToken        </span>
    </div>
    <div class="card-body text-default">
        <div class="schedule-token-create">
            <?= $this->render('_form', [
                'model' => $model,
            ]) 
            ?>
        </div>
    </div>
</div>