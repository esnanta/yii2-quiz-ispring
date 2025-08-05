<?php

use yii\helpers\Html;
use kartik\grid\GridView;
use yii\widgets\Pjax;

/**
 * @var yii\web\View $this
 * @var yii\data\ActiveDataProvider $dataProvider
 * @var common\models\ParticipantSearch $searchModel
 */

$this->title = Yii::t('app', 'Chart Participants');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="participant-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?php /* echo Html::a(Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Participant',
]), ['create'], ['class' => 'btn btn-success'])*/  ?>
    </p>

    <?php Pjax::begin(); echo GridView::widget([
        'dataProvider' => $dataProvider,
        'pageSummaryPosition' => GridView::POS_BOTTOM,
        'showPageSummary' => true,
        'toolbar' => [],
        
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            [
                'attribute' => 'group_id',
                'label' => Yii::t('app', 'Group'),
                'value' => function($model){
                    if ($model->group)
                    {return $model->group->title;}
                    else
                    {return NULL;}
                },
                'filterType' => GridView::FILTER_SELECT2,
                'filter' => $groupList,
                'filterWidgetOptions' => [
                    'pluginOptions' => ['allowClear' => true],
                ],
                'filterInputOptions' => ['placeholder' => '', 'id' => 'grid-group-search-group_id']
            ],
            [
                'attribute' => 'username',
                'vAlign' => 'middle',
                'width' => '180px',
                'value' => function ($model, $key, $index, $widget) {
                    return ($model->user_id != null) ? $model->user->username : '';
                },
                'filter' => true, // enable default text input
                'filterInputOptions' => [
                    'class' => 'form-control', // use active CSS
                    'placeholder' => '',
                ],
                'format' => 'html',
            ],
            'name',
            [
                'class' => 'common\widgets\ActionColumn',
                'header'=> 'Chart',
                'contentOptions' => ['style' => 'white-space:nowrap;'],
                'template'=>'{chart}',
                'buttons' => [
                    'chart' => function ($url, $model) {
                        return Html::a('<i class="fas fa-chart-line"></i>',
                            Yii::$app->urlManager->createUrl(['chart/profile-chart',
                                'id' => $model->user_id,
                                'title' => $model->name]),
                            [
                                'title' => Yii::t('yii', 'Participant Chart'),
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
            'heading' => '<h3 class="panel-title"><i class="glyphicon glyphicon-th-list"></i> ' .
                Html::encode($this->title).' </h3>',
            'type' => 'default',
            //'before' => Html::a('<i class="glyphicon glyphicon-plus"></i> Add', ['create'], ['class' => 'btn btn-success']),
            //'after' => Html::a('<i class="glyphicon glyphicon-repeat"></i> Reset List', ['index'], ['class' => 'btn btn-info']),
            'showFooter' => false
        ],
    ]); Pjax::end(); ?>
    

</div>
