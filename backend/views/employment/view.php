<?php

use common\helper\LabelHelper;
use yii\helpers\Html;
use kartik\detail\DetailView;
use kartik\select2\Select2;

/**
 * @var yii\web\View $this
 * @var common\models\Employment $model
 */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Employments'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$create = LabelHelper::getCreateButton();
?>
<div class="employment-view">

    <?= DetailView::widget([
        'model' => $model,
        'condensed' => false,
        'hover' => true,
        'mode' => Yii::$app->request->get('edit') == 't' ? DetailView::MODE_EDIT : DetailView::MODE_VIEW,
        'panel' => [
            'heading' => $this->title.$create,
            'type' => LabelHelper::getDetailViewType(),
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
            'sequence',
            [
                'attribute'=>'description', 
                'format'=>'html',
                'type'=>DetailView::INPUT_TEXTAREA,                    
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
        'enableEditMode' => Yii::$app->user->can('update-employment'),
    ]) ?>

</div>
