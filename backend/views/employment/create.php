<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Employment $model
 * @var common\models\Office $officeList
 */

$this->title = Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Employment',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Employments'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="card border-default mb-3">
    <div class="card-header"> <?=Yii::t('app', 'Please fill out the form below');?>
        <span class="float-right">
            <?= Html::encode($this->title) ?>
        </span>
    </div>
    <div class="card-body text-default">
        <div class="period-create">
            <?= $this->render('_form', [
                'model' => $model,
                'officeList'=>$officeList
            ])
            ?>
        </div>
    </div>
</div>