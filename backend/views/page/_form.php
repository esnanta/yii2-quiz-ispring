<?php

use common\models\Page;
use yii\helpers\Html;
use bajadev\ckeditor\CKEditor;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use kartik\widgets\FileInput;
use kartik\select2\Select2;

/**
 * @var yii\web\View $this
 * @var common\models\Page $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="page-form">

    <?php $form = ActiveForm::begin([
        'type' => ActiveForm::TYPE_HORIZONTAL,
        'options'=>['enctype'=>'multipart/form-data'] 
    ]); 

    if(empty($model->page_type) || $model->page_type == Page::PAGE_TYPE_TEXT) {
        echo Form::widget([
            'model' => $model,
            'form' => $form,
            'columns' => 1,
            'attributes' => [
                'page_type' => [
                    'type' => Form::INPUT_WIDGET,
                    'widgetClass'=> Select2::class,
                    'options' => [
                        'data' => $pageTypeList,
                        'options' => ['placeholder' => 'Choose Theme', 'disabled'=>false],
                    ],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                ],

                'title' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => '', 'maxlength' => 100]],
            ]
        ]);

        echo $form->field($model, 'content')->widget(CKEditor::class, [
            'editorOptions' => [
                'preset' => 'standard', // basic, standard, full
                'inline' => false,
                'filebrowserBrowseUrl' => 'browse-images',
                'filebrowserUploadUrl' => 'upload-images',
                'extraPlugins' => 'imageuploader',
            ],
        ]);
    }
    else {
        echo Form::widget([

            'model' => $model,
            'form' => $form,
            'columns' => 1,
            'attributes' => [
                'page_type' => [
                    'type' => Form::INPUT_WIDGET,
                    'widgetClass'=> Select2::class,
                    'options' => [
                        'data' => $pageTypeList,
                        'options' => ['placeholder' => 'Choose Theme', 'disabled'=>false],
                    ],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                ],
                'title' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => '', 'maxlength' => 100]],
            ]
        ]);

        // your fileinput widget for single file upload
        echo $form->field($model, 'image')->widget(FileInput::class, [
            'options'=>['accept'=>'image/*'],
            'pluginOptions'=>['allowedFileExtensions'=>['jpg','gif','png']
            ]]);
    }

    echo Form::widget([

        'model' => $model,
        'form' => $form,
        'columns' => 1,
        'attributes' => [
            'description' => ['type' => Form::INPUT_TEXTAREA, 'options' => ['placeholder' => 'Enter Description...','rows' => 6]],           
        ]

    ]);

    echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'),
        ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']
    );
    ActiveForm::end(); ?>

</div>
