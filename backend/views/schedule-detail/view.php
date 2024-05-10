<?php

use kartik\select2\Select2;
use yii\helpers\Html;
use kartik\detail\DetailView;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var common\models\ScheduleDetail $model
 */

$this->title = $model->schedule->title.'-'.$model->subject->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Schedule Details'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$create = Html::a('<i class="fas fa-plus"></i>', ['create'], ['class' => 'button float-right','style'=>'color:#333333;padding:0 5px']);

?>
<div class="schedule-detail-view">

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
            [
                'columns' => [
                    [
                        'attribute' => 'office_id',
                        'value' => ($model->office_id != null) ? $model->office->title : '',
                        'format' => 'html',
                        'type' => DetailView::INPUT_SELECT2,
                        'options' => ['id' => 'office_id', 'prompt' => '', 'disabled' => (Yii::$app->user->identity->isAdmin) ? false : true],
                        'items' => $officeList,
                        'widgetOptions' => [
                            'class' => Select2::class,
                            'data' => $officeList,
                        ],
                        'valueColOptions' => ['style' => 'width:30%']
                    ],
                    [
                        'attribute' => 'schedule_id',
                        'value' => ($model->schedule_id != null) ? $model->schedule->title : '',
                        'format' => 'html',
                        'type' => DetailView::INPUT_SELECT2,
                        'options' => ['id' => 'schedule_id', 'prompt' => '', 'disabled' => false],
                        'items' => $scheduleList,
                        'widgetOptions' => [
                            'class' => Select2::class,
                            'data' => $scheduleList,
                        ],
                        'valueColOptions' => ['style' => 'width:30%']
                    ],
                ],
            ],

            [
                'columns' => [
                    [
                        'attribute' => 'subject_id',
                        'value' => ($model->subject_id != null) ? $model->subject->title : '',
                        'format' => 'html',
                        'type' => DetailView::INPUT_SELECT2,
                        'options' => ['id' => 'subject_id', 'prompt' => '', 'disabled' => false],
                        'items' => $subjectList,
                        'widgetOptions' => [
                            'class' => Select2::class,
                            'data' => $subjectList,
                        ],
                        'valueColOptions' => ['style' => 'width:30%']
                    ],
                    [
                        'attribute' => 'remark',
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                ],
            ],

            'asset_name',

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
        'enableEditMode' => Yii::$app->user->can('update-scheduledetail'),
    ]) ?>

</div>
