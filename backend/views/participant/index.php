<?php

use common\helper\IconHelper;
use yii\helpers\Html;
use kartik\grid\GridView;
use yii\widgets\Pjax;

/**
 * @var yii\web\View $this
 * @var yii\data\ActiveDataProvider $dataProvider
 * @var common\models\ParticipantSearch $searchModel
 */

$this->title = Yii::t('app', 'Participants');
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
        'toolbar' => [
            [
                'content'=>
                    Html::a('<i class="fas fa-plus"></i> Add New', ['create'], ['class' => 'btn btn-success'])
                    . ' '.
                    Html::a('<i class="fas fa-redo"></i> Reset List', ['index'], ['class' => 'btn btn-info'])
                    . ' '.
                    Html::a('<i class="fas fa-upload"></i> Import', ['select'], ['class' => 'btn btn-primary']),
                'options' => ['class' => 'btn-group-md']
            ],
            //'{export}',
            //'{toggleData}'
        ],
        
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
                'template'=>'{reset} {update} {view}',
                'buttons' => [
                    'reset' => function ($url, $model) {
                        return Html::a(IconHelper::getReset(),
                            Yii::$app->urlManager->createUrl(['profile/reset', 'id' => $model->id, 'schId','title'=>$model->title]),
                            [
                                'title' => Yii::t('yii', 'Reset'),
                                'class'=>'btn btn-sm btn-danger '.$model->getIsButtonDisabled(),
                            ]
                        );
                    },

                    'update' => function ($url, $model) {
                        return Html::a(IconHelper::getUpdate(),
                            Yii::$app->urlManager->createUrl(['profile/view', 'id' => $model->id, 'edit' => 't']),
                            [
                                'title' => Yii::t('yii', 'Edit'),
                                'class'=>'btn btn-sm btn-info',
                            ]
                        );
                    },
                    'view' => function ($url, $model) {
                        return Html::a(IconHelper::getView(),
                            Yii::$app->urlManager->createUrl(['profile/view', 'id' => $model->id, 'title'=>$model->title,]),
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
            'heading' => '<h3 class="panel-title"><i class="glyphicon glyphicon-th-list"></i> ' .
                Html::encode($this->title).' </h3>',
            'type' => 'default',
            //'before' => Html::a('<i class="glyphicon glyphicon-plus"></i> Add', ['create'], ['class' => 'btn btn-success']),
            //'after' => Html::a('<i class="glyphicon glyphicon-repeat"></i> Reset List', ['index'], ['class' => 'btn btn-info']),
            'showFooter' => false
        ],
    ]); Pjax::end(); ?>
    

</div>
