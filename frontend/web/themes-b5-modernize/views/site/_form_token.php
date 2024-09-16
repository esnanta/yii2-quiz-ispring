<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;

/**
 * @var yii\web\View $this
 * @var frontend\models\TokenForm $tokenForm
 * @var yii\widgets\ActiveForm $form
 */
?>

<?php $form = ActiveForm::begin(['type' => ActiveForm::TYPE_HORIZONTAL]); ?>

<div class="row">
    <div class="col-md-4">
        <span class="align-middle">
            <?=Yii::t('app', 'Current Token');?> : <br>
            <?=$tokenForm->getCurrentToken();?>
        </span>
    </div>
    <div class="col-md-6">
        <?= $form->field($tokenForm, 'token')->textInput(['placeholder' => ''])->label('') ?>
    </div>
    <div class="col-md-2">
        <?= Html::submitButton(Yii::t('app', '<i class="fas fa-save"></i>'), [
            'class' => 'btn btn-primary',
            'style' => 'width: 100%;' // Ensure the button takes full column width
        ]) ?>
    </div>
</div>

<?php ActiveForm::end(); ?>


