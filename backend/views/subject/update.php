<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Subject $model
 */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Subject',
]) . ' ' . $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Subjects'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>

<div class="card border-default mb-3">
    <div class="card-header">
        <?=Yii::t('app', 'Please fill out the form below');?>
        <span class="float-right">
            <?= Html::encode($this->title) ?>
        </span>
    </div>
    <div class="card-body text-default">
        <div class="subject-create">
            <?= $this->render('_form', [
                'model' => $model,
                'officeList' => $officeList,
            ]) ?>
        </div>
    </div>
</div>