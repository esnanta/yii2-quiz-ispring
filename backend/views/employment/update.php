<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Employment $model
 */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Employment',
]) . ' ' . $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Employments'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>

<div class="card g-brd-gray-light-v7 g-rounded-3 g-mb-30">
    <header class="card-header g-brd-bottom-none g-px-15 g-px-30--sm g-pt-15 g-pt-20--sm g-pb-10 g-pb-15--sm">
        <div class="media">
            <h3 class="d-flex align-self-center text-uppercase g-font-size-12 g-font-size-default--md g-color-black g-mr-10 mb-0">
                Please fill out the form below
            </h3>

            <div class="media-body d-flex justify-content-end">
                <?= Html::encode($this->title) ?>   
            </div>
        </div>
    </header>

    <div class="card-block g-pa-15 g-pa-30--sm">
        <?= $this->render('_form', [
            'model' => $model,
            'officeList'=>$officeList
        ]) ?>
    </div>
</div>
