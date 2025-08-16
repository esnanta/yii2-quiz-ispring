<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 */

$this->title = Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Owner',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Profile'), 'url' => ['profile/index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="card border-default mb-3">
    <div class="card-header">
        <?=Yii::t('app', 'Please fill out the form below');?>
        <span class="float-right"><?=$this->title;?></span>
    </div>
    <div class="card-body text-default">
        <div class="fuel-create">

            <?= $this->render('_form_user_regular', [
                'model' => $model,
                'userTypeList' => $userTypeList,
                'profileList' => $profileList,
            ]) 
            ?>
        </div>

    </div>
</div>