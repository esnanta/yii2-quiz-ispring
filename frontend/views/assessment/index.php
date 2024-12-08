<?php

use common\helper\ApexChartHelper;
use common\helper\IconHelper;
use yii\helpers\Html;
use kartik\grid\GridView;
use yii\widgets\Pjax;

/**
 * @var yii\web\View $this
 * @var yii\data\ActiveDataProvider $dataProvider
 * @var common\models\AssessmentSearch $searchModel
 * @var array $participantList Array of participants
 * @var array $scheduleList Array of schedules
 * @var array $subjectList Array of subject
 * @var array $questionTypeList Array of question type
 * @var array $periodList Array of period
 * @var array $categories Array of categories
 * @var array $series Array of series data for charts
 */

$this->title = Yii::t('app', 'Assessment');
$this->params['breadcrumbs'][] = $this->title;
?>

<?php Pjax::begin();
echo GridView::widget([
    'dataProvider' => $dataProvider,

    'toolbar' => [
        [
            'content'=>
                Html::a('<i class="fas fa-redo"></i> Reset List', ['index'], ['class' => 'btn btn-info']),
            'options' => ['class' => 'btn-group-md']
        ],
        //'{export}',
        //'{toggleData}'
    ],

    'filterModel' => $searchModel,
    'columns' => [
        ['class' => 'yii\grid\SerialColumn'],
        [
            'attribute' => 'schedule_id',
            'vAlign'=>'middle',
            'width'=>'180px',
            'value'=>function ($model, $key, $index, $widget) {
                return ($model->schedule_id!=null) ? $model->schedule->getUrl():'';
            },
            'filterType' => GridView::FILTER_SELECT2,
            'filter'=>$scheduleList,
            'filterWidgetOptions'=>[
                'pluginOptions'=>['allowClear'=>true],
            ],
            'filterInputOptions'=>['placeholder'=>''],
            'format'=>'html',
        ],
        [
            'attribute'=>'participant_id',
            'vAlign'=>'middle',
            'width'=>'180px',
            'value'=>function ($model, $key, $index, $widget) {
                return ($model->participant_id!=null) ? $model->participant->title:'';
            },
            'filterType' => GridView::FILTER_SELECT2,
            'filter' => $participantList,
            'filterWidgetOptions'=>[
                'pluginOptions'=>['allowClear'=>true],
            ],
            'filterInputOptions'=>['placeholder'=>''],
            'format'=>'raw'
        ],
        [
            'attribute' => 'subject_id',
            'vAlign'=>'middle',
            'width'=>'180px',
            'value'=>function ($model, $key, $index, $widget) {
                return ($model->subject_id!=null) ? $model->subject->title:'';
            },
            'filterType' => GridView::FILTER_SELECT2,
            'filter' => $subjectList,
            'filterWidgetOptions'=>[
                'pluginOptions'=>['allowClear'=>true],
            ],
            'filterInputOptions'=>['placeholder'=>''],
            'format'=>'raw'
        ],
        [
            'attribute'=>'question_type',
            'vAlign'=>'middle',
            'width'=>'120px',
            'value'=>function ($model, $key, $index, $widget) {
                return ($model->question_type!=null) ? $model->getOneQuestionType($model->question_type):'';
            },
            'filterType' => GridView::FILTER_SELECT2,
            'filter'=>$questionTypeList,
            'filterWidgetOptions'=>[
                'pluginOptions'=>['allowClear'=>true],
            ],
            'filterInputOptions'=>['placeholder'=>''],
            'format'=>'raw'
        ],
        [
            'attribute'=>'period_id',
            'vAlign'=>'middle',
            'width'=>'180px',
            'value'=>function ($model, $key, $index, $widget) {
                return ($model->period_id!=null) ? $model->period->title:'';
            },
            'filterType' => GridView::FILTER_SELECT2,
            'filter' => $periodList,
            'filterWidgetOptions'=>[
                'pluginOptions'=>['allowClear'=>true],
            ],
            'filterInputOptions'=>['placeholder'=>''],
            'format'=>'raw'
        ],
        [
            'attribute'=>'earned_points',
            'vAlign'=>'middle',
        ],
        [
            'attribute'=>'passing_score',
            'vAlign'=>'middle',
        ],
        [
            'attribute'=>'gained_score',
            'vAlign'=>'middle',
        ],
        [
            'attribute'=>'evaluate_score',
            'vAlign'=>'middle',
        ],
        [
            'attribute'=>'time_limit',
            'vAlign'=>'middle',
            'value'=>function ($model, $key, $index, $widget) {
                return gmdate("H:i:s", $model->time_limit);
            },
        ],
        [
            'attribute'=>'used_time',
            'vAlign'=>'middle',
            'value'=>function ($model, $key, $index, $widget) {
                return gmdate("H:i:s", $model->used_time);
            },
        ],
        [
            'class' => 'common\widgets\ActionColumn',
            'contentOptions' => ['style' => 'white-space:nowrap;'],
            'template'=>'{view}',
            'buttons' => [
                'view' => function ($url, $model) {
                    return Html::a(IconHelper::getView(),
                        Yii::$app->urlManager->createUrl(['assessment/view', 'id' => $model->id]),
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


