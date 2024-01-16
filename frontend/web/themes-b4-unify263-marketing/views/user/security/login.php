<?php

/*
 * This file is part of the Dektrium project.
 *
 * (c) Dektrium project <http://github.com/dektrium>
 *
 * For the full copyright and license information, please view the LICENSE.md
 * file that was distributed with this source code.
 */

use dektrium\user\widgets\Connect;
use dektrium\user\models\LoginForm;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/**
 * @var yii\web\View $this
 * @var dektrium\user\models\LoginForm $model
 * @var dektrium\user\Module $module
 */

$this->title = Yii::t('user', 'Profile Login');
//$this->params['breadcrumbs'][] = $this->title;
?>

<?= $this->render('/_alert', ['module' => Yii::$app->getModule('user')]) ?>

<!-- Login -->
<section class="g-min-height-100vh g-flex-centered g-bg-lightblue-radialgradient-circle">
    <div class="container g-py-100">
        <div class="row justify-content-center">
            <div class="col-sm-8 col-lg-5">
                <div class="u-shadow-v24 g-bg-white rounded g-py-40 g-px-30">
                    <header class="text-center mb-4">
                        <h2 class="h2 g-color-black g-font-weight-600"><?= Html::encode($this->title) ?></h2>
                    </header>

                    <?php $form = ActiveForm::begin([
                        'id' => 'login-form',
                        'enableAjaxValidation' => true,
                        'enableClientValidation' => false,
                        'validateOnBlur' => false,
                        'validateOnType' => false,
                        'validateOnChange' => false,
                        'class'=>'g-py-15',
                    ]) ?>                

                        <!-- Form -->
                        <div class="mb-4">
                            <?php if ($module->debug): ?>
                                <?= $form->field($model, 'login', [
                                    'inputOptions' => [
                                        'autofocus' => 'autofocus',
                                        'class' => 'form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v4 g-brd-primary--hover rounded g-py-15 g-px-15',
                                        'tabindex' => '1']])->dropDownList(LoginForm::loginList());
                                ?>
                            <?php else: ?>
                                <?= $form->field($model, 'login',
                                    ['inputOptions' => [
                                        'autofocus' => 'autofocus', 
                                        'class' => 'form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v4 g-brd-primary--hover rounded g-py-15 g-px-15', 
                                        'tabindex' => '1',
                                        'placeholder'=>'Email'
                                    ]])
                                    ->textInput()
                                    ->label(Yii::t('user', 
                                        '<label class="g-color-gray-dark-v2 g-font-weight-600 g-font-size-13">Email</label>'));
                                ?>
                            <?php endif ?>                            
                        </div>

                        <div class="g-mb-35">

                            <?php if ($module->debug): ?>
                                <div class="alert alert-warning">
                                    <?= Yii::t('user', 'Password is not necessary because the module is in DEBUG mode.'); ?>
                                </div>
                            <?php else: ?>
                                <?= $form->field(
                                    $model,
                                    'password',
                                    ['inputOptions' => [
                                        'class' => 'form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v4 g-brd-primary--hover rounded g-py-15 g-px-15 mb-3', 
                                        'tabindex' => '2',
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
                                                    ['tabindex' => '5']
                                                )
                                                . ')' : '')
                                        ) 
                                ?>
                            <?php endif ?>                            

                            <div class="row justify-content-between">
                                <div class="col-8 align-self-center">
                                    <label class="form-check-inline u-check g-color-gray-dark-v5 g-font-size-12 g-pl-25 mb-0">
                                        <?php 
                                            $form->field($model, 'rememberMe')
                                            ->checkbox([
                                                //'label'=>Yii::t('user', 'Remember Me'),
                                                'class'=>'u-check-icon-checkbox-v6 g-absolute-centered--y g-left-0',
                                                'tabindex' => '3',
                                            ])
                                        ?>   
                                    </label>
                                </div>

                                <div class="col-4 align-self-center text-right">
                                    <?= Html::submitButton(
                                        Yii::t('user', 'Sign in'),
                                        ['class' => 'btn btn-md u-btn-primary rounded g-py-13 g-px-25', 'tabindex' => '4']
                                    ) ?>   
                                </div>
                            </div>
                        </div>

                        <!-- End Form -->
                    <?php ActiveForm::end(); ?>
                
                    <footer class="text-center">
                        <?php if ($module->enableRegistration): ?>
                            <p class="g-color-gray-dark-v5 g-font-size-13 mb-0">
                                <?= "Don't have an account? ".Html::a(Yii::t('user', 'signup'), ['/user/registration/register']) ?>
                            </p>
                        <?php endif ?>                    

                        <?php if ($module->enableConfirmation): ?>
                            <p class="g-color-gray-dark-v5 g-font-size-13 mb-0">
                                <?= "Didn't receive confirmation message? ".Html::a(Yii::t('user', 'resend'), ['/user/registration/resend']) ?>
                            </p>
                        <?php endif ?>
                        <?= Connect::widget([
                            'baseAuthUrl' => ['/user/security/auth'],
                        ]) ?>                    
                    </footer>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End Login -->
