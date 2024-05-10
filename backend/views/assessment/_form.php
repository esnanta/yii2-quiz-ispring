<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var common\models\Assessment $model
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

            'assessment_id' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Assessment ID...']],

            'participant_id' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Participant ID...']],

            'created_by' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter created_by...']],

            'updated_by' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter updated_by...']],

            'is_deleted' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Is Deleted...']],

            'deleted_by' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter deleted_by...']],

            'verlock' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Verlock...']],

            'earned_points' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Earned Points...', 'maxlength' => 18]],

            'passing_score' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Passing Score...', 'maxlength' => 18]],

            'passing_score_percent' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Passing Score Percent...', 'maxlength' => 18]],

            'gained_score' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Gained Score...', 'maxlength' => 18]],

            'created_at' => ['type' => Form::INPUT_WIDGET, 'widgetClass' => DateControl::class,'options' => ['type' => DateControl::FORMAT_DATE]],

            'updated_at' => ['type' => Form::INPUT_WIDGET, 'widgetClass' => DateControl::class,'options' => ['type' => DateControl::FORMAT_DATE]],

            'deleted_at' => ['type' => Form::INPUT_WIDGET, 'widgetClass' => DateControl::class,'options' => ['type' => DateControl::FORMAT_DATE]],

            'app_version' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter App Version...', 'maxlength' => 50]],

            'quiz_title' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Quiz Title...', 'maxlength' => 50]],

            'quiz_type' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Quiz Type...', 'maxlength' => 50]],

            'username' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Username...', 'maxlength' => 50]],

            'time_limit' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Time Limit...', 'maxlength' => 50]],

            'used_time' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Used Time...', 'maxlength' => 50]],

            'time_spent' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Time Spent...', 'maxlength' => 50]],

            'uuid' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Uuid...', 'maxlength' => 36]],

        ]

    ]);

    echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'),
        ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']
    );
    ActiveForm::end(); ?>

</div>
