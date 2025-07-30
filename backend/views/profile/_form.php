<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use kartik\select2\Select2;

/**
 * @var yii\web\View $this
 * @var common\models\Profile $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="profile-form">

    <?php $form = ActiveForm::begin(['type' => ActiveForm::TYPE_HORIZONTAL]); echo Form::widget([

        'model' => $model,
        'form' => $form,
        'columns' => 1,
        'attributes' => [

            'office_id' => [
                'type' => Form::INPUT_WIDGET,
                'widgetClass' => Select2::class,
                'options' => [
                    'data' => $officeList,
                    'options' => ['placeholder' => Yii::t('app', ''), 'disabled' => (Yii::$app->user->identity->isAdmin) ? false : true],
                ],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ],
            'group_id' => [
                'type' => Form::INPUT_WIDGET,
                'widgetClass' => Select2::class,
                'options' => [
                    'data' => $groupList,
                    'options' => ['placeholder' => Yii::t('app', ''), 'disabled' => (Yii::$app->user->identity->isAdmin) ? false : true],
                ],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ],

            'user_type' => [
                'type' => Form::INPUT_WIDGET,
                'widgetClass' => Select2::class,
                'options' => [
                    'data' => $userTypeList,
                    'options' => ['placeholder' => Yii::t('app', '')],
                ],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ],

            'name' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => '', 'maxlength' => 255]],
            'identity_number' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => '', 'maxlength' => 100]],
            'bio' => ['type' => Form::INPUT_TEXTAREA, 'options' => ['placeholder' => '','rows' => 6]],
        ]

    ]);

    echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'),
        ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']
    );
    ActiveForm::end(); ?>

</div>
