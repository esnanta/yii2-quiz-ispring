<?php

use kartik\datecontrol\DateControl;
use kartik\widgets\Select2;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Schedule */
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

    <?php $form = ActiveForm::begin(['options' => [
            'enctype' => 'multipart/form-data',
            'multiple' => true
    ]]); ?>

    <?= $form->errorSummary($model,['class'=>'alert alert-danger', 'role'=>"alert"]); ?>

    <?= $form->field($model, 'id', ['template' => '{input}'])->textInput(['style' => 'display:none']); ?>

    <div class="row">
        <div class="col-md-6 col-xs-12">
            <?= $form->field($model, 'title')->textInput() ?>
            <?= $form->field($model, 'period_id')->widget(Select2::class, [
                'data' => $periodList,
                'options' => ['placeholder' => Yii::t('app', '')],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ]); ?>
            <?= $form->field($model, 'group_id')->widget(Select2::class, [
                'data' => $groupList,
                'options' => ['placeholder' => Yii::t('app', '')],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ]); ?>
        </div>
        <div class="col-md-6 col-xs-12">
            <?= $form->field($model, 'date_start')->widget(DateControl::class, [
                'type' => DateControl::FORMAT_DATETIME,
                'saveFormat' => 'php:Y-m-d H:i:s',
                //'ajaxConversion' => true,
                'options' => [
                    'pluginOptions' => [
                        'placeholder' => Yii::t('app', ''),
                        'autoclose' => true,
                    ]
                ],
            ]); ?>
            <?= $form->field($model, 'date_end')->widget(DateControl::class, [
                'type' => DateControl::FORMAT_DATETIME,
                'saveFormat' => 'php:Y-m-d H:i:s',
                //'ajaxConversion' => true,
                'options' => [
                    'pluginOptions' => [
                        'placeholder' => Yii::t('app', ''),
                        'autoclose' => true,
                    ]
                ],
            ]); ?>
            <?= $form->field($model, 'room_id')->widget(Select2::class, [
                'data' => $roomList,
                'options' => ['placeholder' => Yii::t('app', '')],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ]); ?>
        </div>

    </div>

    <?php
    $forms = [
        [
            'label' => '<i class="glyphicon glyphicon-book"></i> ' . Html::encode(Yii::t('app', 'ScheduleDetail')),
            'content' => $this->render('_formScheduleDetail', [
                'row' => ArrayHelper::toArray($model->scheduleDetails),
                'subjectList' => $subjectList
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

    <div class="row">
        <div class="col-md-6 col-xs-12">
            <?= $form->field($model, 'staff_id')->widget(Select2::class, [
                'data' => $staffList,
                'options' => ['placeholder' => Yii::t('app', '')],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ]); ?>
            <?= $form->field($model, 'description')->textarea(['rows' => 4]) ?>
        </div>
        <div class="col-md-6 col-xs-12"></div>
    </div>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
