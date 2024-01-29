<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\AssessmentSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="form-assessment-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id', ['template' => '{input}'])->textInput(['style' => 'display:none']); ?>

    <?= $form->field($model, 'office_id')->widget(\kartik\widgets\Select2::class, [
        'data' => \yii\helpers\ArrayHelper::map(\common\models\Office::find()->orderBy('id')->asArray()->all(), 'id', 'title'),
        'options' => ['placeholder' => Yii::t('app', 'Choose Tx office')],
        'pluginOptions' => [
            'allowClear' => true
        ],
    ]); ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true, 'placeholder' => 'Title']) ?>

    <?= $form->field($model, 'schedule_id')->widget(\kartik\widgets\Select2::class, [
        'data' => \yii\helpers\ArrayHelper::map(\common\models\Schedule::find()->orderBy('id')->asArray()->all(), 'id', 'title'),
        'options' => ['placeholder' => Yii::t('app', 'Choose Tx schedule')],
        'pluginOptions' => [
            'allowClear' => true
        ],
    ]); ?>


    <?php /* echo $form->field($model, 'description')->textarea(['rows' => 6]) */ ?>

    <?php /* echo $form->field($model, 'is_deleted')->textInput(['placeholder' => 'Is Deleted']) */ ?>

    <?php /* echo $form->field($model, 'verlock', ['template' => '{input}'])->textInput(['style' => 'display:none']); */ ?>

    <?php /* echo $form->field($model, 'uuid')->textInput(['maxlength' => true, 'placeholder' => 'Uuid']) */ ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
