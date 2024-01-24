<?php

use kartik\detail\DetailView;
use kartik\select2\Select2;
use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var backend\models\ScheduleDetail $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="schedule-detail-form">

    <?php $form = ActiveForm::begin(['type' => ActiveForm::TYPE_HORIZONTAL]); echo Form::widget([

        'model' => $model,
        'form' => $form,
        'columns' => 1,
        'attributes' => [
            'schedule_id' => [
                'type' => Form::INPUT_WIDGET,
                'widgetClass' => Select2::class,
                'options' => [
                    'data' => $scheduleList,
                    'options' => ['placeholder' => '', 'disabled' => true],
                ],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ],
            'subject_id' => [
                'type' => Form::INPUT_WIDGET,
                'widgetClass' => Select2::class,
                'options' => [
                    'data' => $subjectList,
                    'options' => ['placeholder' => '', 'disabled' => true],
                ],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ],
            'remark' => ['type' => Form::INPUT_TEXTAREA, 'options' =>
                [
                    'placeholder' => '',
                    'rows' => 1,
                    'disabled' => true
                ]
            ],

            'asset' => ['type' => Form::INPUT_FILE, 'options' => ['placeholder' => '', 'maxlength' => 100]],
        ]

    ]);

    echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'),
        ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']
    );
    ActiveForm::end(); ?>

</div>
