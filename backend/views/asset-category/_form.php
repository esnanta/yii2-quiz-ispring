<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var common\models\AssetCategory $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="archive-category-form">

    <?php $form = ActiveForm::begin(['type' => ActiveForm::TYPE_HORIZONTAL]); echo Form::widget([

        'model' => $model,
        'form' => $form,
        'columns' => 1,
        'attributes' => [
            'title' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => '', 'maxlength' => 200]],
            'sequence' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => '']],
            'description' => ['type' => Form::INPUT_TEXTAREA, 'options' => ['placeholder' => '','rows' => 6]],
        ]

    ]);

    echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'),
        ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']
    );
    ActiveForm::end(); ?>

</div>
