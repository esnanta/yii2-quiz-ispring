<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var backend\models\TestResult $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="test-result-form">

    <?php $form = ActiveForm::begin(['type' => ActiveForm::TYPE_HORIZONTAL]); echo Form::widget([

        'model' => $model,
        'form' => $form,
        'columns' => 1,
        'attributes' => [

            'office_id' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Office ID...']],

            'test1' => ['type' => Form::INPUT_TEXTAREA, 'options' => ['placeholder' => 'Enter Test1...','rows' => 6]],

            'test2' => ['type' => Form::INPUT_TEXTAREA, 'options' => ['placeholder' => 'Enter Test2...','rows' => 6]],

            'test3' => ['type' => Form::INPUT_TEXTAREA, 'options' => ['placeholder' => 'Enter Test3...','rows' => 6]],

            'verlock' => ['type' => TabularForm::INPUT_TEXT, 'options' => ['placeholder' => 'Enter verlock...']],

        ]

    ]);

    echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'),
        ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']
    );
    ActiveForm::end(); ?>

</div>
