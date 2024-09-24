<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use kartik\select2\Select2;

/**
 * @var yii\web\View $this
 * @var common\models\Group $model
 * @var common\models\Participant $listParticipants
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="group-edit-participants">

    <h1><?= Html::encode($this->title) ?></h1>

    <?php $form = ActiveForm::begin(['type' => ActiveForm::TYPE_HORIZONTAL]); ?>

    <?php foreach ($listParticipants as $index => $participant): ?>
        <h3>Participant #<?= $index + 1 ?></h3>

        <?php
        echo Form::widget([
            'model' => $participant,
            'form' => $form,
            'columns' => 1,
            'attributes' => [
                // Hidden field for the participant ID
                'id' => [
                    'type' => Form::INPUT_HIDDEN,
                    'options' => ['value' => $participant->id]
                ],

                // Office ID using Select2 widget
                'office_id' => [
                    'type' => Form::INPUT_WIDGET,
                    'widgetClass' => Select2::class,
                    'options' => [
                        'data' => $officeList,
                        'options' => [
                            'placeholder' => 'Choose Office',
                            'disabled' => (Yii::$app->user->identity->isAdmin) ? false : true
                        ],
                    ],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                ],

                // Participant Title
                'title' => [
                    'type' => Form::INPUT_TEXT,
                    'options' => [
                        'placeholder' => 'Enter participant title',
                        'maxlength' => 100
                    ]
                ],

                // Identity Number
                'identity_number' => [
                    'type' => Form::INPUT_TEXT,
                    'options' => [
                        'placeholder' => 'Enter identity number',
                        'maxlength' => 100
                    ]
                ],

                // Username
                'username' => [
                    'type' => Form::INPUT_TEXT,
                    'options' => [
                        'placeholder' => 'Enter username',
                        'maxlength' => 100
                    ]
                ],

                // Email
                'email' => [
                    'type' => Form::INPUT_TEXT,
                    'options' => [
                        'placeholder' => 'Enter email',
                        'maxlength' => 100
                    ]
                ],

                'group_id' => [
                    'type' => Form::INPUT_WIDGET,
                    'widgetClass' => Select2::class,
                    'options' => [
                        'data' => $groupList,
                        'options' => ['placeholder' => ''],
                    ],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                ],
            ]
        ]);
        ?>

    <?php endforeach; ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>
</div>
