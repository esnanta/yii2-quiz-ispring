<?php

use common\helper\DateHelper;
use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var common\models\ScheduleToken $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="schedule-token-form">

    <?php $form = ActiveForm::begin(['type' => ActiveForm::TYPE_HORIZONTAL]);
    echo Form::widget([

            'model' => $model,
            'form' => $form,
            'columns' => 1,
            'attributes' => [
                    'date_start' => [
                            'type' => Form::INPUT_WIDGET,
                            'widgetClass' => DateControl::class,
                            'options' => [
                                    'type' => DateControl::FORMAT_DATETIME,
                                    'options' => [
                                            'pluginOptions' => [
                                                    'placeholder' => Yii::t('app', ''),
                                                    'autoclose' => true,
                                            ]
                                    ],
                            ]
                    ],
                    'date_end' => [
                            'type' => Form::INPUT_WIDGET,
                            'widgetClass' => DateControl::class,
                            'options' => [
                                    'type' => DateControl::FORMAT_DATETIME,
                                    'options' => [
                                            'pluginOptions' => [
                                                    'placeholder' => Yii::t('app', ''),
                                                    'autoclose' => true,
                                            ]
                                    ],
                            ]
                    ],
            ]

    ]);

    echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'),
            ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']
    );
    ActiveForm::end(); ?>

</div>