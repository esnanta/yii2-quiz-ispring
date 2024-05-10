<?php

use kartik\select2\Select2;
use yii\helpers\Html;
use kartik\detail\DetailView;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var common\models\Assessment $model
 */

$this->title = $model->quiz_title . '-'.$model->quiz_title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Assessment Details'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$create = Html::a('<i class="fas fa-plus"></i>', ['create'], ['class' => 'button float-right','style'=>'color:#333333;padding:0 5px']);

?>
<div class="assessment-view">

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
                'attribute'=>'schedule_id',
                'format'=>'html',
                'value'=>($model->schedule_id!=null) ? $model->schedule->getUrl():'',
                'type'=>DetailView::INPUT_SELECT2,
                'options' => ['id' => 'schedule_id', 'prompt' => '', 'disabled'=>false],
                'items' => $scheduleList,
                'widgetOptions'=>[
                    'class'=> Select2::class,
                    'data'=>$scheduleList,
                ],
            ],
            [
                'attribute' => 'participant_id',
                'format'=>'html',
                'value'=> ($model->participant_id!=null) ? $model->participant->getUrl():'',
                'type' => DetailView::INPUT_SELECT2,
                'options' => ['id' => 'participant_id', 'prompt' => '', 'disabled'=>false],
                'items' => $participantList,
                'widgetOptions'=>[
                    'class'=> Select2::class,
                    'data' => $participantList,
                ],
            ],

            'app_version',
            'earned_points',
            'passing_score',
            'passing_score_percent',
            'gained_score',
            'quiz_title',
            'quiz_type',
            'username',
            [
                'attribute'=>'time_limit',
                'value' => gmdate("H:i:s", $model->time_limit),
            ],
            [
                'attribute'=>'used_time',
                'value' => gmdate("H:i:s", $model->used_time),
            ],

            'time_spent',
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
        ],
        'deleteOptions' => [
            'url' => ['delete', 'id' => $model->id],
        ],
        'enableEditMode' => Yii::$app->user->can('update-assessment'),
    ]) ?>

</div>
