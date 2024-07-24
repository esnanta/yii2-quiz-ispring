<?php

use common\helper\UIHelper;
use yii\helpers\Html;
use bajadev\ckeditor\CKEditor;
use kartik\detail\DetailView;
use kartik\widgets\FileInput;
use kartik\select2\Select2;
use common\models\Page;
/**
 * @var yii\web\View $this
 * @var common\models\Page $model
 */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Pages (text)', 'url' => ['index','type'=>Page::PAGE_TYPE_TEXT]];
$this->params['breadcrumbs'][] = ['label' => 'Pages (image)', 'url' => ['index','type'=>Page::PAGE_TYPE_IMAGE]];
$this->params['breadcrumbs'][] = $this->title;

$update = UIHelper::getUpdateButton();
$stripTagsButton = Html::a('Remove Tags', ['strip-tags', 'id' => $model->id], ['class' => 'pull-right detail-button label-warning', 'style' => 'padding:0 5px']);
?>
<div class="page-view">

    <?php

    if(empty($model->page_type) || $model->page_type == Page::PAGE_TYPE_TEXT) {
        echo DetailView::widget([
            'model' => $model,
            'condensed' => false,
            'hover' => true,
            'mode' => DetailView::MODE_VIEW,
            'panel' => [
                'heading' => $this->title . $update,
                'type' => UIHelper::getDetailViewType(),
            ],
            'attributes' => [
                [
                    'attribute' => 'description',
                    'format' => 'html',
                    'type' => DetailView::INPUT_TEXTAREA,
                    'displayOnly' => !Yii::$app->user->identity->isAdmin,
                ],
                [
                    'attribute' => 'page_type',
                    'value' => ($model->page_type != null) ? $model->getOnePageType($model->page_type) : '',
                    'format' => 'html',
                    'type' => DetailView::INPUT_SELECT2,
                    'options' => ['id' => 'page_type', 'prompt' => '', 'disabled' => false],
                    'items' => $pageTypeList,
                    'widgetOptions' => [
                        'class' => Select2::class,
                        'data' => $pageTypeList,
                    ],
                    //'valueColOptions' => ['style' => 'width:30%']
                ],
                'title',
                [
                    'attribute' => 'content',
                    'format' => 'html',
                    'value' => htmlspecialchars($model->content) . $stripTagsButton,
                    //'value'=>$model->content.$stripTagsButton,
                    'type' => DetailView::INPUT_WIDGET,
                    'widgetOptions' => [
                        'class' => CKEditor::class,
                        'editorOptions' => [
                            'preset' => 'full', // basic, standard, full
                            'inline' => false,
                            'filebrowserBrowseUrl' => 'browse-images',
                            'filebrowserUploadUrl' => 'upload-images',
                            'extraPlugins' => 'imageuploader',
                        ],
                    ],
                ],
                [
                    'label' => '',
                    'value' => (file_exists($model->getImageFile())) ? Html::a('Remove Image', ['delete-image', 'id' => $model->id], ['class' => 'btn-more hover-effect']) : '',
                    'format' => 'html'
                ],

            ],
            'deleteOptions' => [
                'url' => ['delete', 'id' => $model->id],
            ],
            'enableEditMode' => false,
        ]);
    }
    else{
        echo DetailView::widget([
            'model' => $model,
            'condensed' => false,
            'hover' => true,
            'mode' => DetailView::MODE_VIEW,
            'panel' => [
                'heading' => $this->title . $update,
                'type' => UIHelper::getDetailViewType(),
            ],
            'attributes' => [
                [
                    'attribute' => 'description',
                    'format' => 'html',
                    'type' => DetailView::INPUT_TEXTAREA,
                    'displayOnly' => !Yii::$app->user->identity->isAdmin,
                ],
                [
                    'attribute' => 'page_type',
                    'value' => ($model->page_type != null) ? $model->getOnePageType($model->page_type) : '',
                    'format' => 'html',
                    'type' => DetailView::INPUT_SELECT2,
                    'options' => ['id' => 'page_type', 'prompt' => '', 'disabled' => false],
                    'items' => $pageTypeList,
                    'widgetOptions' => [
                        'class' => Select2::class,
                        'data' => $pageTypeList,
                    ],
                    //'valueColOptions' => ['style' => 'width:30%']
                ],
                'title',
                [
                    'attribute' => 'image',
                    'value' => ($model->getImageUrl()),
                    'format' => ['image', ['width' => 'auto', 'height' => '150px']],

                    'type' => DetailView::INPUT_WIDGET,
                    'widgetOptions' => [
                        'class' => FileInput::class,
                    ]
                ],
                [
                    'label' => '',
                    'value' => (file_exists($model->getImageFile())) ? Html::a('Remove Image', ['delete-image', 'id' => $model->id], ['class' => 'btn-more hover-effect']) : '',
                    'format' => 'html'
                ],

            ],
            'deleteOptions' => [
                'url' => ['delete', 'id' => $model->id],
            ],
            'enableEditMode' => false,
        ]);
    }


    ?>

</div>
