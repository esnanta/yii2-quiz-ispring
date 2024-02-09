<?php

/** @var yii\web\View $this */
/** @var yii\bootstrap5\ActiveForm $form */
/** @var \common\models\LoginParticipantForm $model */

use yii\bootstrap5\ActiveForm;
use yii\bootstrap5\Html;

$this->title = Yii::t('app', 'Sign in as Participant');
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="card">
    <div class="card-header text-white bg-primary">
        <?=Yii::t('app', 'Authentication')?>
        <span class="pull-right"><i class="fas fa-sign-in-alt"></i></span>
    </div>
    <div class="card-body">
        <h5 class="card-title"><?= Html::encode($this->title) ?></h5>

        <?php $form = ActiveForm::begin(['id' => 'login-form']); ?>

        <?= $form->field($model, 'username')->textInput(['autofocus' => true]) ?>

        <?= $form->field($model, 'password')->passwordInput() ?>


        <?=
        Html::submitButton(
            'Login',
            ['class' => 'btn btn-primary', 'name' => 'login-button']
        )
        ?>

        <?php ActiveForm::end(); ?>
    </div>

</div>
