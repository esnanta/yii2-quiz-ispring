<?php

/**
 * @var yii\web\View $this
 * @var common\models\Profile $model
 */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Profile',
]) . ' ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Profiles'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->user_id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>

<div class="panel panel-default">
    <div class="panel-heading">
        <div class="panel-title">
            Please fill out the form below
            <div class="pull-right">
                Profile
            </div>
        </div>
    </div>
    <div class="panel-body">
        <div class="profile-update">
            <?= $this->render('_form', [
                'model' => $model,
                'officeId' => $officeId,
                'officeList' => $officeList,
                'groupList' => $groupList,
                'userTypeList' => $userTypeList,
            ]) ?>
        </div>
    </div>
</div>



