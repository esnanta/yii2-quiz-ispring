<?php

use yii\helpers\Html;
use kartik\detail\DetailView;
use kartik\datecontrol\DateControl;
use kartik\select2\Select2;
use bajadev\ckeditor\CKEditor;
/**
 * @var yii\web\View $this
 * @var common\models\Theme $model
 */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Themes'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$create = Html::a('<i class="fas fa-plus"></i>', ['create'], ['class' => 'button pull-right','style'=>'color:#333333;padding:0 5px']);
$stripTagsButton = Html::a('Remove Tags', ['strip-tags','id'=>$model->id], ['class' => 'pull-right detail-button label-warning','style'=>'padding:0 5px']);
?>
<div class="theme-view">

    <?= DetailView::widget([
        'model' => $model,
        'condensed' => false,
        'hover' => true,
        'mode' => Yii::$app->request->get('edit') == 't' ? DetailView::MODE_EDIT : DetailView::MODE_VIEW,
        'panel' => [
            'heading' => $this->title.$create,
            'type' => DetailView::TYPE_DEFAULT,
        ],
        'attributes' => [
            [
                'attribute'=>'office_id', 
                'value'=>($model->office_id!=null) ? $model->office->title:'',
                'type'=>DetailView::INPUT_SELECT2, 
                'options' => ['id' => 'office_id', 'prompt' => '', 'disabled'=> (Yii::$app->user->identity->isAdmin) ? false : true],
                'items' => $officeList,
                'widgetOptions'=>[
                    'class'=> Select2::class,
                    'data'=>$officeList,
                ],
            ], 
            'title',
            'theme_type',
             [
                 'attribute'=>'content',
                 'format'=>'html',
                 'value'=>htmlspecialchars($model->content).$stripTagsButton,
                 'value'=>$model->content.$stripTagsButton,
                 'type'=>DetailView::INPUT_WIDGET,
                 'widgetOptions'=>[
                     'class'=> CKEditor::class,
                     'editorOptions' => [
                         'preset' => 'full', // basic, standard, full
                         'inline' => false,
                         'filebrowserBrowseUrl' => 'browse-images',
                         'filebrowserUploadUrl' => 'upload-images',
                         'extraPlugins' => 'imageuploader',
                     ],
                 ],
             ],
            'asset_name',
            [
                'attribute'=>'description',
                'format'=>'html',
                'type'=>DetailView::INPUT_TEXTAREA,
                'displayOnly'=>(Yii::$app->user->identity->isAdmin) ? false:true,
            ], 
            
            [
                'group'=>true,
                'rowOptions'=>['class'=>'default']
            ],  
            
            [
                'columns' => [
                    [
                        'attribute'=>'created_at', 
                        'format'=>'date',
                        'type'=>DetailView::INPUT_HIDDEN,      
                        'valueColOptions'=>['style'=>'width:30%']
                    ],  
                    [
                        'attribute'=>'updated_at', 
                        'format'=>'date',
                        'type'=>DetailView::INPUT_HIDDEN, 
                        'valueColOptions'=>['style'=>'width:30%']
                    ],                                
                ],
            ],
            [
                'columns' => [
                    [
                        'attribute'=>'created_by',
                        'value'=>($model->created_by!=null) ? \common\models\User::getName($model->created_by):'',
                        'type'=>DetailView::INPUT_HIDDEN,
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute'=>'updated_by',
                        'value'=>($model->updated_by!=null) ? \common\models\User::getName($model->updated_by):'',
                        'type'=>DetailView::INPUT_HIDDEN,
                        'valueColOptions'=>['style'=>'width:30%']
                    ],                                
                ],
            ],
        ],
        'deleteOptions' => [
            'url' => ['delete', 'id' => $model->id],
        ],
        'enableEditMode' => (Yii::$app->user->can('update-theme')) ? true : false,
    ]) ?>

</div>
