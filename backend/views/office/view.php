<?php

use yii\helpers\Html;
use yii\helpers\Url;
use kartik\detail\DetailView;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var common\models\Office $model
 */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Offices'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$create = Html::a('<i class="fas fa-plus"></i>', ['create'], ['class' => 'button float-right','style'=>'color:#333333;padding:0 5px']);

?>
<div class="office-view">

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
            'title',
            [
                'attribute'=>'unique_id',
                'type'=>DetailView::INPUT_HIDDEN,
            ],
            'phone_number',
            'email:email',
            'web',
            'address',
            'description:ntext',
            
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
        'enableEditMode' => Yii::$app->user->can('update-office'),
    ]) ?>

</div>
