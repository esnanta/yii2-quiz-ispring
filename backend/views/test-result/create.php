<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var backend\models\TestResult $model
 */

$this->title = Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Test Result',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Test Results'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="card border-default mb-3">
    <div class="card-header">Please fill out the form below 
        <span class="pull-right">
            TestResult        </span>
    </div>
    <div class="card-body text-default">
        <div class="test-result-create">
            <?= $this->render('_form', [
                'model' => $model,
            ]) 
            ?>
        </div>
    </div>
</div>