<?php

use common\helper\DateHelper;
use yii\helpers\Html;
use kartik\grid\GridView;
use yii\widgets\Pjax;

/**
 * @var yii\web\View $this
 * @var yii\data\ActiveDataProvider $dataProvider
 * @var common\models\ScheduleTokenSearch $searchModel
 */

$this->title = Yii::t('app', 'Schedule Tokens');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="schedule-token-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?php /* echo Html::a(Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Schedule Token',
]), ['create'], ['class' => 'btn btn-success'])*/ ?>
    </p>

    <?php Pjax::begin();
    echo GridView::widget([
            'dataProvider' => $dataProvider,

            'toolbar' => [
                    [
                            'content' =>
                                    Html::a('<i class="fas fa-plus"></i> Add New', ['create'], ['class' => 'btn btn-success'])
                                    . ' ' .
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
                            'attribute' => 'date_start',
                            'label' => Yii::t('app', 'Start'),
                            'value' => function ($model) {
                                return DateHelper::formatDateTime($model->date_start);
                            },
                    ],
                    [
                            'attribute' => 'date_end',
                            'label' => Yii::t('app', 'End'),
                            'value' => function ($model) {
                                return DateHelper::formatDateTime($model->date_end);
                            },
                    ],
                    'token',
                    'description',
                    [
                            'class' => 'yii\grid\ActionColumn',
                            'buttons' => [
                                    'update' => function ($url, $model) {
                                        return Html::a('<span class="glyphicon glyphicon-pencil"></span>',
                                                Yii::$app->urlManager->createUrl(['schedule-token/view', 'id' => $model->id, 'edit' => 't']),
                                                ['title' => Yii::t('yii', 'Edit'),]
                                        );
                                    }
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
                    'heading' => '<h3 class="panel-title"><i class="glyphicon glyphicon-th-list"></i> ' . Html::encode($this->title) . ' </h3>',
                    'type' => 'default',
                //'before' => Html::a('<i class="glyphicon glyphicon-plus"></i> Add', ['create'], ['class' => 'btn btn-success']),
                //'after' => Html::a('<i class="glyphicon glyphicon-repeat"></i> Reset List', ['index'], ['class' => 'btn btn-info']),
                    'showFooter' => false
            ],
    ]);
    Pjax::end(); ?>


</div>
