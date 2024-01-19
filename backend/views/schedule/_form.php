<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Schedule */
/* @var $form yii\widgets\ActiveForm */

\mootensai\components\JsBlock::widget(['viewFile' => '_script', 'pos'=> \yii\web\View::POS_END, 
    'viewParams' => [
        'class' => 'ScheduleDetail', 
        'relID' => 'schedule-detail', 
        'value' => \yii\helpers\Json::encode($model->scheduleDetails),
        'isNewRecord' => ($model->isNewRecord) ? 1 : 0
    ]
]);
?>

<div class="schedule-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->errorSummary($model); ?>

    <?= $form->field($model, 'id', ['template' => '{input}'])->textInput(['style' => 'display:none']); ?>

    <div class="row">
        <div class="col-md-6 col-xs-12">
            <?= $form->field($model, 'title')->textInput(['maxlength' => true, 'placeholder' => '']) ?>

            <?= $form->field($model, 'subject_id')->widget(\kartik\widgets\Select2::classname(), [
                'data' => $subjectList,
                'options' => ['placeholder' => Yii::t('app', '')],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ]); ?>

            <?= $form->field($model, 'room_id')->widget(\kartik\widgets\Select2::classname(), [
                'data' => $roomList,
                'options' => ['placeholder' => Yii::t('app', '')],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ]); ?>
        </div>
        <div class="col-md-6 col-xs-12">
            <?= $form->field($model, 'date_start')->widget(\kartik\datecontrol\DateControl::classname(), [
                'type' => \kartik\datecontrol\DateControl::FORMAT_DATETIME,
                'saveFormat' => 'php:Y-m-d H:i:s',
                //'ajaxConversion' => true,
                'options' => [
                    'pluginOptions' => [
                        'placeholder' => Yii::t('app', ''),
                        'autoclose' => true,
                    ]
                ],
            ]); ?>

            <?= $form->field($model, 'date_end')->widget(\kartik\datecontrol\DateControl::classname(), [
                'type' => \kartik\datecontrol\DateControl::FORMAT_DATETIME,
                'saveFormat' => 'php:Y-m-d H:i:s',
                //'ajaxConversion' => true,
                'options' => [
                    'pluginOptions' => [
                        'placeholder' => Yii::t('app', ''),
                        'autoclose' => true,
                    ]
                ],
            ]); ?>

            <?= $form->field($model, 'description')->textarea(['rows' => 1]) ?>
        </div>
    </div>

    <?php
    $forms = [
        [
            'label' => '<i class="glyphicon glyphicon-book"></i> ' . Html::encode(Yii::t('app', 'ScheduleDetail')),
            'content' => $this->render('_formScheduleDetail', [
                'row' => \yii\helpers\ArrayHelper::toArray($model->scheduleDetails),
                'participantList' => $participantList
            ]),
        ],
    ];
    echo kartik\tabs\TabsX::widget([
        'items' => $forms,
        'position' => kartik\tabs\TabsX::POS_ABOVE,
        'encodeLabels' => false,
        'pluginOptions' => [
            'bordered' => true,
            'sideways' => true,
            'enableCache' => false,
        ],
    ]);
    ?>
    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
