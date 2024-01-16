<?php

/*
 * This file is part of the Dektrium project.
 *
 * (c) Dektrium project <http://github.com/dektrium>
 *
 * For the full copyright and license information, please view the LICENSE.md
 * file that was distributed with this source code.
 */

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/**
 * @var yii\web\View $this
 * @var yii\widgets\ActiveForm $form
 * @var dektrium\user\models\RecoveryForm $model
 */

$this->title = Yii::t('user', 'Reset your password');
$this->params['breadcrumbs'][] = $this->title;
?>


<section class="g-min-height-100vh g-flex-centered g-bg-lightblue-radialgradient-circle">
    <div class="container g-py-100">
        <div class="row justify-content-center">
            <div class="col-sm-8 col-lg-5">
                <div class="u-shadow-v24 g-bg-white rounded g-py-40 g-px-30">
                    <header class="text-center mb-4">
                        <h2 class="h2 g-color-black g-font-weight-600"><?= Html::encode($this->title) ?></h2>
                    </header>

                    <?php $form = ActiveForm::begin([
                        'id' => 'password-recovery-form',
                        'enableAjaxValidation' => true,
                        'enableClientValidation' => false,
                        'class'=>'g-py-15',
                    ]); ?>

                    <div class="mb-4">
                        <?= $form->field(
                            $model,
                            'password',
                            ['inputOptions' => [
                                'class' => 'form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v4 g-brd-primary--hover rounded g-py-15 g-px-15 mb-3', 
                                'tabindex' => '1',
                                'placeholder'=>'Password'
                            ]])
                            ->passwordInput()
                                ->label(
                                    Yii::t('user', '<label class="g-color-gray-dark-v2 g-font-weight-600 g-font-size-13">Password</label>')
                                    . ($module->enablePasswordRecovery ?
                                        ' (' . Html::a(
                                            Yii::t('user', 'Forgot password?'),
                                            ['/user/recovery/request'],
                                            //['class'=>'d-inline-block g-font-size-12 mb-2 pull-right'],
                                            ['tabindex' => '2']
                                        )
                                        . ')' : '')
                                ) 
                        ?>

                        <?= Html::submitButton(
                            Yii::t('user', 'Finish'),
                            ['class' => 'btn btn-md u-btn-primary rounded g-py-13 g-px-25', 'tabindex' => '3']
                        ) ?> 

                        <?php ActiveForm::end(); ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
