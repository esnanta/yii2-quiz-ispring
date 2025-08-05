<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use kartik\select2\Select2;

/**
 * @var yii\web\View $this
 * @var common\models\Participant $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="participant-form">

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
                    'options' => ['placeholder' => Yii::t('app', 'Choose Office'), 'disabled' => (Yii::$app->user->identity->isAdmin) ? false : true],
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
                    'options' => ['placeholder' => Yii::t('app', 'Choose Group')],
                ],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ],

            'title' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Title...', 'maxlength' => 100]],

            'identity_number' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Identity Number...', 'maxlength' => 100]],

            'username' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Username...', 'maxlength' => 50]],

            'password' => ['type' => Form::INPUT_PASSWORD, 'options' => ['placeholder' => 'Enter Password...', 'maxlength' => 10]],

        ]

    ]);

    echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'),
        ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']
    );
    ActiveForm::end(); ?>

</div>
