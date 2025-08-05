<?php

use common\helper\IconHelper;
use yii\helpers\Html;
use kartik\widgets\ActiveForm;

/**
 * @var yii\web\View $this
 * @var frontend\models\TokenForm $tokenForm
 * @var yii\widgets\ActiveForm $form
 */
?>

<?php $form = ActiveForm::begin(['type' => ActiveForm::TYPE_VERTICAL]); ?>

<div class="row">
    <div class="col-md-12">
        <?= $form->field($tokenForm, 'token')->textInput([
                'placeholder' => Yii::t('app', 'Enter your token')])
            ->label('') ?>
    </div>
    <div class="col-md-12">
        <?= Html::submitButton(IconHelper::getSave(), [
            'class' => 'btn btn-primary',
            'style' => 'width: 100%;' // Ensure the button takes full column width
        ]) ?>
    </div>
</div>

<?php ActiveForm::end(); ?>


