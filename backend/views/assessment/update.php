<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Assessment $model
 */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Assessment',
]) . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Assessment Details'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>

<div class="panel panel-default">
    <div class="panel-heading">
        <div class="panel-title">
            <?=Yii::t('app', 'Please fill out the form below');?>
            <div class="float-right">
                <?= Html::encode($this->title) ?>
            </div>
        </div>
    </div>
    <div class="panel-body">
        <div class="assessment-update">
            <?= $this->render('_form', [
                'model' => $model,
                'scheduleList' => $scheduleList,
                'participantList' => $participantList,
                'subjectTypeList' => $subjectTypeList
            ]) ?>
        </div>
    </div>
</div>



