<?php

use yii\helpers\Html;
use kartik\grid\GridView;
use yii\widgets\Pjax;

/**
 * @var yii\web\View $this
 * @var yii\data\ActiveDataProvider $dataProvider
 * @var common\models\ThemeSearch $searchModel
 */

$this->title = Yii::t('app', 'Themes');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="theme-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?php /* echo Html::a(Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Theme',
]), ['create'], ['class' => 'btn btn-success'])*/  ?>
    </p>

    <?php Pjax::begin(); echo GridView::widget([
        'dataProvider' => $dataProvider,

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

//            [
//                'attribute'=>'office_id',
//                'vAlign'=>'middle',
//                'width'=>'180px',
//                'value'=>function ($model, $key, $index, $widget) {
//                    return ($model->office_id!=null) ? $model->office->title:'';
//                },
//                'filterType'=>GridView::FILTER_SELECT2,
//                'filter'=>$officeList,
//                'filterWidgetOptions'=>[
//                    'pluginOptions'=>['allowClear'=>true],
//                ],
//                'filterInputOptions'=>['placeholder'=>''],
//                'format'=>'raw'
//            ],
            [
                'attribute'=>'theme_type',
                'label'=>'Type',
                'vAlign'=>'middle',
                'width'=>'180px',
                'value'=>function ($model, $key, $index, $widget) {
                    return ($model->theme_type!=null) ? $model->getOneThemeType($model->theme_type):'';
                },
                'filterType'=>GridView::FILTER_SELECT2,
                'filter'=>$themTypeList,
                'filterWidgetOptions'=>[
                    'pluginOptions'=>['allowClear'=>true],
                ],
                'filterInputOptions'=>['placeholder'=>''],
                'format'=>'raw'
            ],
            [
                'attribute' => 'title',
                'vAlign'=>'middle',
                'format'=>'html',
                'value' => function($model){
                    return $model->title;
                },
            ],
            [
                'attribute' => 'content',
                'vAlign'=>'middle',
                'format'=>'html',
                'value' => function($model){
                    return $model->content;
                },
            ],
            [
                'header'=>'Image',
                'format' => ['image',['width'=>'100','height'=>'50']],
                'vAlign'=>'middle',
                'width'=>'30px',
                'value'=>function ($model, $key, $index, $widget) {
                    return ($model->getImageUrl());
                },
            ],

[
                'class' => 'common\widgets\ActionColumn',
                'contentOptions' => ['style' => 'white-space:nowrap;'],
                'template'=>'{update} {view}',
                'buttons' => [
                    'update' => function ($url, $model) {
                        return Html::a('<i class="fas fa-pencil-alt"></i>',
                            Yii::$app->urlManager->createUrl(['theme/view', 'id' => $model->id, 'edit' => 't']),
                            [
                                'title' => Yii::t('yii', 'Edit'),
                                'class'=>'btn btn-sm btn-info',
                            ]
                        );
                    },
                    'view' => function ($url, $model) {
                        return Html::a('<i class="fas fa-eye"></i>',
                            Yii::$app->urlManager->createUrl(['theme/view', 'id' => $model->id]),
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
