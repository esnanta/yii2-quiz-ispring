<?php

/** @var yii\web\View $this */
/** @var yii\bootstrap5\ActiveForm $form */

/** @var \frontend\models\LoginParticipantForm $model */

use frontend\models\LoginParticipantForm;
use yii\bootstrap5\ActiveForm;
use yii\bootstrap5\Html;

$this->title = Yii::t('app', 'Authentication');
$this->params['breadcrumbs'][] = $this->title;
?>

    <div class="container d-flex justify-content-center align-items-center min-vh-50">
        <div class="card" style="max-width: 400px; width: 100%;">
            <div class="card-header text-white bg-primary d-flex justify-content-between align-items-center">
                <?= Yii::t('app', 'Sign in as Participant') ?>
                <i class="fas fa-sign-in-alt"></i>
            </div>
            <div class="card-body">
                <?php $form = ActiveForm::begin(['id' => 'login-form']); ?>

                <?= $form->field($model, 'username')->textInput(['autofocus' => true]) ?>

                <?= $form->field($model, 'password')->passwordInput() ?>

                <div class="form-check mb-3">
                    <?= Html::checkbox('reveal-password', false, ['id' => 'reveal-password', 'class' => 'form-check-input']) ?>
                    <?= Html::label('Show password', 'reveal-password', ['class' => 'form-check-label']) ?>
                </div>

                <?php //$form->field($model, 'token')->textInput() ?>

                <?= Html::submitButton(
                    'Login',
                    ['class' => 'btn btn-primary w-100', 'name' => 'login-button']
                ) ?>

                <?php ActiveForm::end(); ?>
            </div>
        </div>
    </div>

<?php
$this->registerJs(
    "jQuery('#reveal-password').change(function(){
            jQuery('#loginparticipantform-password').attr('type', this.checked ? 'text' : 'password');
        });"
);
?>