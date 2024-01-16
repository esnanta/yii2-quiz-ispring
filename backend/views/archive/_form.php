<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use kartik\datecontrol\DateControl;
use kartik\select2\Select2;
use kartik\widgets\FileInput;
/**
 * @var yii\web\View $this
 * @var backend\models\Archive $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="archive-form">

    <?php $form = ActiveForm::begin(['type' => ActiveForm::TYPE_VERTICAL]); ?>
    <div class="row">
        <div class="col-md-4">
            <?php
                echo $form->field($model, 'asset')->widget(FileInput::class, [
                    'pluginOptions' => ['previewFileType' => 'any','showUpload' => false,]
                ]);
            ?>
        </div>
        <div class="col-md-8">
            <?php 
                echo Form::widget([
                    'model' => $model,
                    'form' => $form,
                    'columns' => 1,
                    'attributes' => [
                        'title' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Title...', 'maxlength' => 200]],
                        'date_issued' => [
                            'type' => Form::INPUT_WIDGET,
                            'widgetClass'=> DateControl::class,
                            //'format'=>'date',
                        ],
                        'is_visible' => [
                            'type' => Form::INPUT_WIDGET,
                            'widgetClass' => Select2::class,
                            'options' => [
                                'data' => $isVisibleList,
                                'options' => ['placeholder' => '', 'disabled' => false],
                            ],
                            'pluginOptions' => [
                                'allowClear' => true
                            ],
                        ],
                        'archive_category_id' => [
                            'type' => Form::INPUT_WIDGET,
                            'widgetClass' => Select2::class,
                            'options' => [
                                'data' => $archiveCategoryList,
                                'options' => ['placeholder' => 'Choose Category', 'disabled' => false],
                            ],
                            'pluginOptions' => [
                                'allowClear' => true
                            ],
                        ],
                    ]
                ]);

//                echo $form->field($model, 'description')->widget(CKEditor::class, [
//                    'editorOptions' => [
//                        'preset' => 'basic', // basic, standard, full
//                        'inline' => false,
//                    ],
//                ]);
            ?>
        </div>
    </div>

    <?php
        echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'),
            ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']
        );
    ?>

    <?php ActiveForm::end(); ?>  

</div>
