<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use kartik\datecontrol\DateControl;

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

            'office_id' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Office ID...']],

            'group_id' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Group ID...']],

            'created_by' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter created_by...']],

            'updated_by' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter updated_by...']],

            'is_deleted' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Is Deleted...']],

            'deleted_by' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter deleted_by...']],

            'verlock' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Verlock...']],

            'created_at' => ['type' => Form::INPUT_WIDGET, 'widgetClass' => DateControl::class,'options' => ['type' => DateControl::FORMAT_DATE]],

            'updated_at' => ['type' => Form::INPUT_WIDGET, 'widgetClass' => DateControl::class,'options' => ['type' => DateControl::FORMAT_DATE]],

            'deleted_at' => ['type' => Form::INPUT_WIDGET, 'widgetClass' => DateControl::class,'options' => ['type' => DateControl::FORMAT_DATE]],

            'title' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Title...', 'maxlength' => 100]],

            'identity_number' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Identity Number...', 'maxlength' => 100]],

            'username' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Username...', 'maxlength' => 50]],

            'password' => ['type' => Form::INPUT_PASSWORD, 'options' => ['placeholder' => 'Enter Password...', 'maxlength' => 10]],

            'uuid' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Uuid...', 'maxlength' => 36]],

        ]

    ]);

    echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'),
        ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']
    );
    ActiveForm::end(); ?>

</div>
