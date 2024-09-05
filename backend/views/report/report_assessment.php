<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Assessment $model
 */

$this->title = Yii::t('app', 'Report');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Assessment'), 'url' => ['assessment/index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="card border-default mb-3">
    <div class="card-header">
        <?=Yii::t('app', 'Please fill out the form below');?>
        <span class="float-right">
            <?= Html::encode($this->title) ?>
        </span>
    </div>
    <div class="card-body text-default">
        <div class="assessment-create">
            <?= $this->render('_form_report_assessment', [
                'model' => $model,
                'scheduleList' => $scheduleList,
                'subjectList' => $subjectList,
            ])
            ?>
        </div>
    </div>
</div>