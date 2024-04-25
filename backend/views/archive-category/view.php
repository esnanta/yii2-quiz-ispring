<?php

use yii\helpers\Html;
use kartik\detail\DetailView;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var common\models\ArchiveCategory $model
 */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Archive Categories'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$create = Html::a('<i class="fas fa-plus"></i>', ['create'], ['class' => 'button float-right','style'=>'color:#333333;padding:0 5px']);

?>
<div class="archive-category-view">

    <?= DetailView::widget([
        'model' => $model,
        'condensed' => false,
        'hover' => true,
        'mode' => Yii::$app->request->get('edit') == 't' ? DetailView::MODE_EDIT : DetailView::MODE_VIEW,
        'panel' => [
            'heading' => $this->title.$create,
            'type' => DetailView::TYPE_PRIMARY,
        ],
        'attributes' => [

            'title',
            'sequence',
            'description:ntext',
            
            [
                'group'=>true,
                'rowOptions'=>['class'=>'default']
            ],

            [
                'columns' => [
                    [
                        'attribute' => 'created_at',
                        'format' => [
                            'datetime', (isset(Yii::$app->modules['datecontrol']['displaySettings']['datetime']))
                                ? Yii::$app->modules['datecontrol']['displaySettings']['datetime']
                                : 'd-m-Y H:i:s A'
                        ],
                        'type'=>DetailView::INPUT_HIDDEN,
                        'widgetOptions' => [
                            'class' => DateControl::class,
                            'type' => DateControl::FORMAT_DATETIME
                        ]
                    ],
                    [
                        'attribute' => 'updated_at',
                        'format' => [
                            'datetime', (isset(Yii::$app->modules['datecontrol']['displaySettings']['datetime']))
                                ? Yii::$app->modules['datecontrol']['displaySettings']['datetime']
                                : 'd-m-Y H:i:s A'
                        ],
                        'type'=>DetailView::INPUT_HIDDEN,
                        'widgetOptions' => [
                            'class' => DateControl::class,
                            'type' => DateControl::FORMAT_DATETIME
                        ]
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
        'enableEditMode' => Yii::$app->user->can('update-archivecategory'),
    ]) ?>

</div>
