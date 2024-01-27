<?php

use kartik\select2\Select2;
use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var backend\models\Participant $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="participant-form">

    <?php
    $form = ActiveForm::begin(['type' => ActiveForm::TYPE_HORIZONTAL]); echo Form::widget([

        'model' => $model,
        'form' => $form,
        'columns' => 1,
        'attributes' => [
//            'office_id' => [
//                'type' => Form::INPUT_WIDGET,
//                'widgetClass' => Select2::class,
//                'options' => [
//                    'data' => $officeList,
//                    'options' => ['placeholder' => 'Choose Office', 'disabled' => (Yii::$app->user->identity->isAdmin) ? false : true],
//                ],
//                'pluginOptions' => [
//                    'allowClear' => true
//                ],
//            ],

            'archive_id' => [
                'type' => Form::INPUT_WIDGET,
                'widgetClass' => Select2::class,
                'options' => [
                    'data' => $archiveList,
                    'options' => ['placeholder' => '', 'disabled' => true],
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
                    'options' => ['placeholder' => '', 'disabled' => false],
                ],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ],
        ]

    ]);

    echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Import') : Yii::t('app', 'Import'),
        ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']
    );
    ActiveForm::end(); ?>

</div>
