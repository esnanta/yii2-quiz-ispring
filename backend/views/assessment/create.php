<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Assessment */

$this->title = Yii::t('app', 'Create Assessment');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Assessment'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="card border-default mb-3">
    <div class="card-header">
        <?=Yii::t('app', 'Please fill out the form below');?>
        <span class="pull-right">
            <?=Yii::t('app', 'Assessment');?>
        </span>
    </div>
    <div class="card-body text-default">
        <div class="assessment-create">
            <?= $this->render('_form', [
                'model' => $model,
                'scheduleList' => $scheduleList,
                'periodList' => $periodList
            ]) 
            ?>
        </div>
    </div>
</div>
