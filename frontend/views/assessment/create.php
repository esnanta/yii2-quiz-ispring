<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Assessment $model
 */

$this->title = Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Assessment Detail',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Assessment Details'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="card border-default mb-3">
    <div class="card-header">Please fill out the form below 
        <span class="pull-right">
            AssessmentDetail        </span>
    </div>
    <div class="card-body text-default">
        <div class="assessment-create">
            <?= $this->render('_form', [
                'model' => $model,
            ]) 
            ?>
        </div>
    </div>
</div>