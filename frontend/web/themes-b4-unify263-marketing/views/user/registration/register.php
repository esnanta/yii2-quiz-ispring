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
 * @var dektrium\user\models\User $model
 * @var dektrium\user\Module $module
 */

$this->title = Yii::t('user', 'Sign up');
//$this->params['breadcrumbs'][] = $this->title;
?>

<!-- Signup -->

<section class="g-min-height-100vh g-flex-centered g-bg-lightblue-radialgradient-circle">
    <div class="container g-py-100">
        <div class="row justify-content-center">
            <div class="col-sm-8 col-lg-5">
                <div class="u-shadow-v24 g-bg-white rounded g-py-40 g-px-30">
                    <header class="text-center mb-4">
                        <h2 class="h2 g-color-black g-font-weight-600"><?= Html::encode($this->title) ?></h2>
                    </header>

                    <?php $form = ActiveForm::begin([
                        'id' => 'registration-form',
                        'enableAjaxValidation' => true,
                        'enableClientValidation' => false,
                        'class'=>'g-py-15',
                    ]) ?>                

                        <!-- Form -->
                        <div class="mb-4">
                            
                            <?= $form->field($model, 'email',
                                ['inputOptions' => [
                                    'autofocus' => 'autofocus', 
                                    'class' => 'form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v4 g-brd-primary--hover rounded g-py-15 g-px-15', 
                                    'tabindex' => '1',
                                    'placeholder'=>'Email'
                                ]])
                                ->textInput(['autofocus' => true])
                                ->label(Yii::t('user', 
                                    '<label class="g-color-gray-dark-v2 g-font-weight-600 g-font-size-13">Email</label>'));
                            ?>

                            <?= $form->field($model, 'username',
                                ['inputOptions' => [
                                    'autofocus' => 'autofocus', 
                                    'class' => 'form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v4 g-brd-primary--hover rounded g-py-15 g-px-15', 
                                    'tabindex' => '1',
                                    'placeholder'=>'Username'
                                ]])
                                ->textInput(['autofocus' => true])
                                ->label(Yii::t('user', 
                                    '<label class="g-color-gray-dark-v2 g-font-weight-600 g-font-size-13">Username</label>'));
                            ?>

                            <?php if ($module->enableGeneratingPassword == false): ?>
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

                            <?= Html::submitButton(
                                Yii::t('user', 'Sign up'),
                                ['class' => 'btn btn-md u-btn-primary rounded g-py-13 g-px-25', 'tabindex' => '2']
                            ) ?>                        
                        </div>


                        <!-- End Form -->
                    <?php ActiveForm::end(); ?>

                    <footer class="text-center">
                        <p class="g-color-gray-dark-v5 g-font-size-13 mb-0">
                            <?= "Already have an account? ".Html::a(Yii::t('user', 'signin'), ['/user/security/login']) ?>
                        </p>                    
                    </footer>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- End Signup -->









