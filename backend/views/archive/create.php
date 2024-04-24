<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Archive $model
 */

$this->title = Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Archive',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Archives'), 'url' => ['index']];
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
                'officeList' => $officeList,
                'archiveCategoryList'=>$archiveCategoryList,
                'isVisibleList' => $isVisibleList,
                'archiveTypeList' => $archiveTypeList,
            ])
            ?>
        </div>
    </div>
</div>