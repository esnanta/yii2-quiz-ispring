<?php

/** @var yii\web\View $this */
/** @var yii\bootstrap5\ActiveForm $form */
/** @var \common\models\LoginParticipantForm $model */

use yii\bootstrap5\ActiveForm;
use yii\bootstrap5\Html;

$this->title = 'Login';
?>
<div class="site-login">

    <div class="mt-5 offset-lg-3 col-lg-6">

        <div class="card border-default mb-3">
            <div class="card-header">Please fill out the following fields to login:
                <span class="pull-right">
                    <?= Html::encode($this->title) ?>
                </span>
            </div>
            <div class="card-body text-default">
                <div class="schedule-create">

                    <?php $form = ActiveForm::begin(['id' => 'login-form']); ?>

                    <?= $form->field($model, 'username')->textInput(['autofocus' => true]) ?>

                    <?= $form->field($model, 'password')->passwordInput() ?>

                    <div class="form-group">
                        <?=
                        Html::submitButton(
                            'Login',
                            ['class' => 'btn btn-primary btn-block', 'name' => 'login-button']
                        )
                        ?>
                    </div>

                    <?php ActiveForm::end(); ?>
                </div>
            </div>
        </div>

    </div>
</div>
