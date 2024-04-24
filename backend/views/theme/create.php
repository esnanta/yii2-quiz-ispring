<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Theme $model
 */

$this->title = Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Theme',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Themes'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="card border-default mb-3">
    <div class="card-header">Please fill out the form below <span class="float-right">Theme</span></div>
    <div class="card-body text-default">
        <div class="theme-create">

            <?= $this->render('_form', [
                'model' => $model,
                'officeList'=>$officeList,
                'themTypeList'=>$themTypeList
            ]) 
            ?>
        </div>

    </div>
</div>