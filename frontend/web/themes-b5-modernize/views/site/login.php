<?php

/** @var yii\web\View $this */
/** @var yii\bootstrap5\ActiveForm $form */
/** @var LoginParticipantForm $model */

use common\models\LoginParticipantForm;
use yii\bootstrap5\ActiveForm;
use yii\bootstrap5\Html;
use kartik\password\PasswordInput;

$this->title = Yii::t('app', 'Authentication');
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="card">
    <div class="card-header text-white bg-primary">
        <?=Yii::t('app', 'Sign in as Participant')?>
        <span class="pull-right"><i class="fas fa-sign-in-alt"></i></span>
    </div>
    <div class="card-body">

        <?php $form = ActiveForm::begin(['id' => 'login-form']); ?>

        <?= $form->field($model, 'username')->textInput(['autofocus' => true]) ?>

        <?= $form->field($model, 'password')->passwordInput() ?>

        <?= Html::checkbox('reveal-password', false, ['id' => 'reveal-password']) ?>

        <?= Html::label('Show password', 'reveal-password') ?>

        <br>
        <br>

        <?=
        Html::submitButton(
            'Login',
            ['class' => 'btn btn-primary', 'name' => 'login-button']
        )
        ?>

        <?php ActiveForm::end(); ?>
    </div>

</div>

<?php
    $this->registerJs(
            "jQuery('#reveal-password')
            .change(function(){jQuery('#loginparticipantform-password')
            .attr('type',this.checked?'text':'password');})"
    );
?>