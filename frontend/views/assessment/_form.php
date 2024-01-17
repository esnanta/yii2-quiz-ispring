<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var backend\models\Assessment $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="assessment-form">

    <?php $form = ActiveForm::begin(['type' => ActiveForm::TYPE_HORIZONTAL]); echo Form::widget([

        'model' => $model,
        'form' => $form,
        'columns' => 1,
        'attributes' => [

            'office_id' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Office ID...']],

            'created_by' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter created_by...']],

            'updated_by' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter updated_by...']],

            'verlock' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Verlock...']],

            'is_deleted' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Is Deleted...']],

            'deleted_by' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter deleted_by...']],

            'test1' => ['type' => Form::INPUT_TEXTAREA, 'options' => ['placeholder' => 'Enter Test1...','rows' => 6]],

            'test2' => ['type' => Form::INPUT_TEXTAREA, 'options' => ['placeholder' => 'Enter Test2...','rows' => 6]],

            'test3' => ['type' => Form::INPUT_TEXTAREA, 'options' => ['placeholder' => 'Enter Test3...','rows' => 6]],

            'created_at' => ['type' => Form::INPUT_WIDGET, 'widgetClass' => DateControl::classname(),'options' => ['type' => DateControl::FORMAT_DATE]],

            'updated_at' => ['type' => Form::INPUT_WIDGET, 'widgetClass' => DateControl::classname(),'options' => ['type' => DateControl::FORMAT_DATE]],

            'deleted_at' => ['type' => Form::INPUT_WIDGET, 'widgetClass' => DateControl::classname(),'options' => ['type' => DateControl::FORMAT_DATE]],

            'uuid' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Uuid...', 'maxlength' => 36]],

        ]

    ]);

    echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'),
        ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']
    );
    ActiveForm::end(); ?>

</div>
