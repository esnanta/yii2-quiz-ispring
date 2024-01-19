<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Schedule */

$this->title = Yii::t('app', 'Create Schedule');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Schedule'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="card border-default mb-3">
    <div class="card-header">Please fill out the form below 
        <span class="pull-right">
            Schedule        </span>
    </div>
    <div class="card-body text-default">
        <div class="schedule-create">
            <?= $this->render('_form', [
                'model' => $model,
                'subjectList' => $subjectList,
                'roomList' => $roomList,
                'participantList' => $participantList
            ]) 
            ?>
        </div>
    </div>
</div>
