<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Assessment */

$this->title = Yii::t('app', 'Create Assessment');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Assessment'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="card border-default mb-3">
    <div class="card-header">Please fill out the form below 
        <span class="pull-right">
            Assessment        </span>
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
