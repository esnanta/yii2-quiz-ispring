<?php

/* @var $this yii\web\View */
/* @var $searchModel backend\models\AssessmentSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

use yii\helpers\Html;
use kartik\export\ExportMenu;
use kartik\grid\GridView;

$this->title = Yii::t('app', 'Assessment');
$this->params['breadcrumbs'][] = $this->title;
$search = "$('.search-button').click(function(){
	$('.search-form').toggle(1000);
	return false;
});";
$this->registerJs($search);
?>
<div class="assessment-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <div class="search-form" style="display:none">
        <?=  $this->render('_search', ['model' => $searchModel]); ?>
    </div>
    <?php 
    $gridColumn = [
        ['class' => 'yii\grid\SerialColumn'],
        ['attribute' => 'id', 'visible' => false],

        'title',
        [
                'attribute' => 'schedule_id',
                'label' => Yii::t('app', 'Schedule'),
                'value' => function($model){
                    if ($model->schedule)
                    {return $model->schedule->title;}
                    else
                    {return NULL;}
                },
                'filterType' => GridView::FILTER_SELECT2,
                'filter' => $scheduleList,
                'filterWidgetOptions' => [
                    'pluginOptions' => ['allowClear' => true],
                ],
                'filterInputOptions' => ['placeholder' => '', 'id' => 'grid-assessment-search-schedule_id']
            ],

        'description:ntext',

        [
            'class' => 'common\widgets\ActionColumn',
            'contentOptions' => ['style' => 'white-space:nowrap;'],
            'template'=>'{update} {view}',
            'buttons' => [
                'update' => function ($url, $model) {
                    return Html::a('<i class="fas fa-pencil-alt"></i>',
                        Yii::$app->urlManager->createUrl(['assessment/update', 'id' => $model->id]),
                        [
                            'title' => Yii::t('yii', 'Edit'),
                            'class'=>'btn btn-sm btn-info',
                        ]
                    );
                },
                'view' => function ($url, $model) {
                    return Html::a('<i class="fas fa-eye"></i>',
                        Yii::$app->urlManager->createUrl(['assessment/view', 'id' => $model->id]),
                        [
                            'title' => Yii::t('yii', 'View'),
                            'class'=>'btn btn-sm btn-info',
                        ]
                    );
                },
            ],
        ],
    ]; 
    ?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => $gridColumn,
        'pjax' => true,
        'pjaxSettings' => ['options' => ['id' => 'kv-pjax-container-assessment']],
        'panel' => [
            'type' => GridView::TYPE_DEFAULT,
            'heading' => '<h3 class="panel-title"><i class="glyphicon glyphicon-th-list"></i>  ' . Html::encode($this->title).' </h3>',
        ],
        'export' => false,
        // your toolbar can include the additional full export menu
        'toolbar' => [
        
            [
                'content'=>
                    Html::a('<i class="fas fa-plus"></i> Add New', ['create'], ['class' => 'btn btn-success'])
                    . ' '.
                    Html::a('<i class="fas fa-redo"></i> Reset List', ['index'], ['class' => 'btn btn-info'])
                    . ' '.
                    Html::a('<i class="fas fa-search"></i> Advance Search', ['#'], ['class' => 'btn btn-warning search-button']),
                'options' => ['class' => 'btn-group-md', 'style'=>'margin-right:5px']
            ],
            
            '{export}',
            ExportMenu::widget([
                'dataProvider' => $dataProvider,
                'columns' => $gridColumn,
                'target' => ExportMenu::TARGET_BLANK,
                'fontAwesome' => true,
                'dropdownOptions' => [
                    'label' => 'Full',
                    'class' => 'btn btn-default',
                    'itemsBefore' => [
                        '<li class="dropdown-header">Export All Data</li>',
                    ],
                ],
                'exportConfig' => [
                    ExportMenu::FORMAT_PDF => false
                ]
            ]) ,
        ],
        
        'responsive' => true,
        'hover' => true,
        'condensed' => true,
        'floatHeader' => false,

        'bordered' => true,
        'striped' => false,
        'responsiveWrap' => false,
        
        
    ]); ?>

</div>
