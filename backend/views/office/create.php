<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Office $model
 */

$this->title = Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Office',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Offices'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="card border-default mb-3">
    <div class="card-header"><?=Yii::t('app', 'Please fill out the form below')?>
        <span class="float-right">
            <?= Html::encode($this->title) ?>
        </span>
    </div>
    <div class="card-body text-default">
        <div class="group-create">
            <?= $this->render('_form', [
                'model' => $model,
            ])
            ?>
        </div>
    </div>
</div>



