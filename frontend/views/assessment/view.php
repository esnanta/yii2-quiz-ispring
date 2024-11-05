<?php

use common\helper\ApexChartHelper;
use common\helper\LabelHelper;
use kartik\select2\Select2;
use kartik\detail\DetailView;

/**
 * @var yii\web\View $this
 * @var common\models\Assessment $model
 * @var common\models\Schedule $scheduleList
 * @var common\models\Assessment $examTypeList
 * @var common\models\Participant $participantList
 */

$this->title = $model->quiz_title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Assessments'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;

?>

<ul class="nav nav-tabs" id="myTab" role="tablist">
    <li class="nav-item" role="presentation">
        <a class="nav-link active" id="home-tab" data-bs-toggle="tab" href="#profile" role="tab" aria-controls="home" aria-selected="true"><?= Yii::t('app', 'Assessment'); ?></a>
    </li>
    <li class="nav-item" role="presentation">
        <a class="nav-link" id="profile-tab" data-bs-toggle="tab" href="#assessment-progress" role="tab" aria-controls="profile" aria-selected="false"><?= Yii::t('app', 'Progress'); ?></a>
    </li>
    <li class="nav-item" role="presentation">
        <a class="nav-link" id="profile-tab" data-bs-toggle="tab" href="#assessment-radar" role="tab" aria-controls="profile" aria-selected="false"><?= Yii::t('app', 'Radar'); ?></a>
    </li>
</ul>

<div class="tab-content mt-3" id="myTabContent">
    <div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="home-tab">
        <?= DetailView::widget([
            'model' => $model,
            'condensed' => false,
            'hover' => true,
            'mode' => Yii::$app->request->get('edit') == 't' ? DetailView::MODE_EDIT : DetailView::MODE_VIEW,
            'panel' => [
                'heading' => $this->title,
                'type' => LabelHelper::getDetailViewType(),
            ],
            'attributes' => [
                [
                    'attribute'=>'schedule_id',
                    'format'=>'html',
                    'value'=>($model->schedule_id!=null) ? $model->schedule->getUrl():'',
                    'type'=>DetailView::INPUT_SELECT2,
                    'options' => ['id' => 'schedule_id', 'prompt' => '', 'disabled'=>true],
                    'items' => $scheduleList,
                    'widgetOptions'=>[
                        'class'=> Select2::class,
                        'data'=>$scheduleList,
                    ],
                ],
                [
                    'attribute'=>'exam_type',
                    'format'=>'html',
                    'value'=>($model->exam_type!=null) ? $model->getOneExamType($model->exam_type) : '',
                    'type'=>DetailView::INPUT_SELECT2,
                    'options' => ['id' => 'exam_type', 'prompt' => '', 'disabled'=>false],
                    'items' => $examTypeList,
                    'widgetOptions'=>[
                        'class'=> Select2::class,
                        'data'=>$examTypeList,
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
            'enableEditMode' => false,
        ]) ?>
    </div>
    <div class="tab-pane fade" id="assessment-progress" role="tabpanel" aria-labelledby="profile-tab">
        <?= ApexChartHelper::renderParticipantScoreChart(
            $categories, $series, Yii::t('app', 'Participant')
        ); ?>
    </div>
    <div class="tab-pane fade" id="assessment-radar" role="tabpanel" aria-labelledby="profile-tab">
        <?= ApexChartHelper::renderRadarChart(
            $categories, $series, Yii::t('app', 'Participant Evaluation vs Average')
        ); ?>
    </div>
</div>