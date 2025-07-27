<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var common\models\Profile $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="profile-form">

    <?php $form = ActiveForm::begin(['type' => ActiveForm::TYPE_HORIZONTAL]); echo Form::widget([

        'model' => $model,
        'form' => $form,
        'columns' => 1,
        'attributes' => [

            'office_id' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Office...']],

            'group_id' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Rombel...']],

            'user_type' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter User Type...']],

            'created_by' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter created_by...']],

            'updated_by' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter updated_by...']],

            'deleted_by' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter deleted_by...']],

            'verlock' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Verlock...']],

            'bio' => ['type' => Form::INPUT_TEXTAREA, 'options' => ['placeholder' => 'Enter Bio...','rows' => 6]],

            'created_at' => ['type' => Form::INPUT_WIDGET, 'widgetClass' => DateControl::class,'options' => ['type' => DateControl::FORMAT_DATE]],

            'updated_at' => ['type' => Form::INPUT_WIDGET, 'widgetClass' => DateControl::class,'options' => ['type' => DateControl::FORMAT_DATE]],

            'deleted_at' => ['type' => Form::INPUT_WIDGET, 'widgetClass' => DateControl::class,'options' => ['type' => DateControl::FORMAT_DATE]],

            'name' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Name...', 'maxlength' => 255]],

            'public_email' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Public Email...', 'maxlength' => 255]],

            'gravatar_email' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Gravatar Email...', 'maxlength' => 255]],

            'location' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Location...', 'maxlength' => 255]],

            'website' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Website...', 'maxlength' => 255]],

            'identity_number' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter No ID...', 'maxlength' => 100]],

            'gravatar_id' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Gravatar ID...', 'maxlength' => 32]],

            'timezone' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Timezone...', 'maxlength' => 40]],

            'asset_name' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Nama Aset...', 'maxlength' => 200]],

            'uuid' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Uuid...', 'maxlength' => 36]],

        ]

    ]);

    echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'),
        ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']
    );
    ActiveForm::end(); ?>

</div>
