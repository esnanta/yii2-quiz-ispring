<?php

use kartik\grid\GridView;
use yii\helpers\Html;
use yii\widgets\Pjax;

/**
 * @var yii\web\View $this
 * @var yii\data\ActiveDataProvider $dataProvider
 * @var common\models\AssetCategorySearch $searchModel
 */

$this->title = Yii::t('app', 'Asset Categories');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="archive-category-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?php /* echo Html::a(Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Asset Category',
]), ['create'], ['class' => 'btn btn-success'])*/  ?>
    </p>

    <?php Pjax::begin(); echo GridView::widget([
        'dataProvider' => $dataProvider,
        'pageSummaryPosition' => GridView::POS_BOTTOM,
        'showPageSummary' => true,
        'toolbar' => [
            [
                'content'=>
                    Html::a('<i class="fas fa-plus"></i> Add New', ['create'], ['class' => 'btn btn-success'])
                     . ' '.
                    Html::a('<i class="fas fa-redo"></i> Reset List', ['index'], ['class' => 'btn btn-info']),
                'options' => ['class' => 'btn-group-md']
            ],
            //'{export}',
            //'{toggleData}'
        ],
        
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'title',
            'sequence',
            'description:ntext',
            [
                'attribute' => 'created_at',
                'value'=>'created_at',
                'enableSorting' => true,
                'format'=>'date',
                'options' => [
                    'format' => Yii::$app->params['dateDisplayFormat'],
                ],
                'filterType' => GridView::FILTER_DATE_RANGE,
                'filterWidgetOptions' => ([
                    'attribute' => 'date_range',
                    'presetDropdown' => false,
                    'convertFormat' => true,
                    'pluginOptions'=>[
                        'locale'=>['format' => Yii::$app->params['dateDisplayFormat']],
                    ]                
                ])
            ], 

            [
                'class' => 'common\widgets\ActionColumn',
                'contentOptions' => ['style' => 'white-space:nowrap;'],
                'template'=>'{update} {view}',                
                'buttons' => [
                    'update' => function ($url, $model) {
                        return Html::a('<i class="fas fa-pencil-alt"></i>',
                            Yii::$app->urlManager->createUrl(['asset-category/view', 'id' => $model->id, 'edit' => 't']),
                            [
                                'title' => Yii::t('yii', 'Edit'),
                                'class'=>'btn btn-sm btn-info',
                            ]
                        );
                    },
                    'view' => function ($url, $model) {
                        return Html::a('<i class="fas fa-eye"></i>',
                            Yii::$app->urlManager->createUrl(['asset-category/view', 'id' => $model->id]),
                            [
                                'title' => Yii::t('yii', 'View'),
                                'class'=>'btn btn-sm btn-info',
                            ]
                        );
                    },        
                ],
            ],
        ],
        'responsive' => true,
        'hover' => true,
        'condensed' => true,
        'floatHeader' => false,
                        
        'bordered' => true,
        'striped' => false,
        'responsiveWrap' => false,

        'panel' => [
            'heading' => '<h3 class="panel-title"><i class="glyphicon glyphicon-th-list"></i> '.Html::encode($this->title).' </h3>',
            'type' => 'default',
            //'before' => Html::a('<i class="glyphicon glyphicon-plus"></i> Add', ['create'], ['class' => 'btn btn-success']),
            //'after' => Html::a('<i class="glyphicon glyphicon-repeat"></i> Reset List', ['index'], ['class' => 'btn btn-info']),
            'showFooter' => false
        ],
    ]); Pjax::end(); ?>
    

</div>
