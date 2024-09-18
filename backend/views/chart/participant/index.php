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
                'attribute' => 'identity_number',
                'label' => Yii::t('app', 'No Id'),
            ],
            'title',
            //'username',
            //'password',
            [
                'attribute'=>'status',
                'vAlign'=>'middle',
                //'width'=>'120px',
                'value'=>function ($model, $key, $index, $widget) {
                    return ($model->status!=null) ? $model->getOneStatus($model->status):'';
                },
                'filterType'=>GridView::FILTER_SELECT2,
                'filter'=>$statusList,
                'filterWidgetOptions'=>[
                    'pluginOptions'=>['allowClear'=>true],
                ],
                'filterInputOptions'=>['placeholder'=>''],
                'format'=>'html'
            ],
            [
                'attribute' => 'last_login_at',
                'label' => Yii::t('app', 'Last Login'),
                'value'=>function ($model, $key, $index, $widget) {
                    return ($model->last_login_at!=null) ? date('h:i:s a', strtotime($model->last_login_at)):'';
                },
            ],
            [
                'class' => 'common\widgets\ActionColumn',
                'contentOptions' => ['style' => 'white-space:nowrap;'],
                'template'=>'{chart}',
                'buttons' => [
                    'chart' => function ($url, $model) {
                        return Html::a('<i class="fas fa-chart-line"></i>',
                            Yii::$app->urlManager->createUrl(['chart/participant-chart', 'id' => $model->id, 'title'=>$model->title,]),
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
