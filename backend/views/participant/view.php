<?php

use common\helper\LabelHelper;
use kartik\select2\Select2;
use yii\helpers\Html;
use kartik\detail\DetailView;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var common\models\Participant $model
 * @var common\models\office $officeList
 * @var common\models\Group $groupList
 */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Participants'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$create = LabelHelper::getCreateButton();
?>


<ul class="nav nav-tabs" id="myTab" role="tablist">
    <li class="nav-item" role="presentation">
        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#profile" role="tab"
           aria-controls="home" aria-selected="true"><?= Yii::t('app', 'Participants'); ?></a>
    </li>
    <li class="nav-item" role="presentation">
        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#assessment" role="tab"
           aria-controls="profile" aria-selected="false"><?= Yii::t('app', 'Assessment'); ?></a>
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
                'heading' => $this->title.$create,
                'type' => LabelHelper::getDetailViewType(),
            ],
            'attributes' => [
                [
                    'attribute'=>'office_id',
                    'value'=>($model->office_id!=null) ? $model->office->title:'',
                    'type'=>DetailView::INPUT_SELECT2,
                    'options' => ['id' => 'office_id', 'prompt' => '', 'disabled'=> (Yii::$app->user->identity->isAdmin) ? false : true],
                    'items' => $officeList,
                    'widgetOptions'=>[
                        'class'=> Select2::class,
                        'data'=>$officeList,
                    ],
                ],
                [
                    'attribute'=>'group_id',
                    'value'=>($model->group_id!=null) ? $model->group->title:'',
                    'type'=>DetailView::INPUT_SELECT2,
                    'options' => ['id' => 'group_id', 'prompt' => '', 'disabled'=> false],
                    'items' => $groupList,
                    'widgetOptions'=>[
                        'class'=> Select2::class,
                        'data'=>$groupList,
                    ],
                ],
                'title',
                'identity_number',
                'username',
                'password',
                [
                    'columns' => [
                        [
                            'attribute' => 'created_at',
                            'format' => [
                                'datetime', (isset(Yii::$app->modules['datecontrol']['displaySettings']['datetime']))
                                    ? Yii::$app->modules['datecontrol']['displaySettings']['datetime']
                                    : 'd-m-Y H:i:s A'
                            ],
                            'type'=>DetailView::INPUT_HIDDEN,
                            'widgetOptions' => [
                                'class' => DateControl::class,
                                'type' => DateControl::FORMAT_DATETIME
                            ]
                        ],
                        [
                            'attribute' => 'updated_at',
                            'format' => [
                                'datetime', (isset(Yii::$app->modules['datecontrol']['displaySettings']['datetime']))
                                    ? Yii::$app->modules['datecontrol']['displaySettings']['datetime']
                                    : 'd-m-Y H:i:s A'
                            ],
                            'type'=>DetailView::INPUT_HIDDEN,
                            'widgetOptions' => [
                                'class' => DateControl::class,
                                'type' => DateControl::FORMAT_DATETIME
                            ]
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
            'enableEditMode' => Yii::$app->user->can('update-participant'),
        ]) ?>
    </div>
    <div class="tab-pane fade" id="assessment" role="tabpanel" aria-labelledby="profile-tab">
        <?php
        echo 'assessment';
        ?>
    </div>
</div>