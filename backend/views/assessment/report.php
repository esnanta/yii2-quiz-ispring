<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var backend\models\FuelSales $model
 */

$this->title = Yii::t('app', 'Report {modelClass}', [
    'modelClass' => 'Fuel Sales',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Assessment'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="card border-default mb-3">
    <div class="card-header">
        <?=Yii::t('app', 'Please fill out the form below');?>
        <span class="pull-right">
            <?= Html::encode($this->title) ?>
        </span>
    </div>
    <div class="card-body text-default">
        <div class="assessment-create">
            <?= $this->render('_form_report', [
                'model' => $model,
                'assessmentList' => $assessmentList,
                'subjectList' => $subjectList,
            ])
            ?>
        </div>
    </div>
</div>