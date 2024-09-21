<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use kartik\select2\Select2;

/**
 * @var yii\web\View $this
 * @var common\models\Period $model
 * @var common\models\Office $officeList
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="period-form">

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
                    'options' => ['placeholder' => 'Choose Office', 'disabled' => (Yii::$app->user->identity->isAdmin) ? false : true],
                ],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ],
            'title' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => '', 'maxlength' => 200]],
            'is_active' => [
                'type' => Form::INPUT_WIDGET,
                'widgetClass' => Select2::class,
                'options' => [
                    'data' => $isActiveList,
                    'options' => ['placeholder' => '', 'disabled' => false],
                ],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ],
            'description' => ['type' => Form::INPUT_TEXTAREA, 'options' => ['placeholder' => '','rows' => 6]],
        ]

    ]);

    echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'),
        ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']
    );
    ActiveForm::end(); ?>

</div>
