<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Subject $model
 */

$this->title = Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Subject',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Subjects'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="card border-default mb-3">
    <div class="card-header">Please fill out the form below 
        <span class="pull-right">
            Subject        </span>
    </div>
    <div class="card-body text-default">
        <div class="subject-create">
            <?= $this->render('_form', [
                'model' => $model,
                'officeList' => $officeList
            ]) 
            ?>
        </div>
    </div>
</div>