<?php

use common\helper\LabelHelper;
use common\models\User;
use kartik\detail\DetailView;
use kartik\widgets\Select2;

/**
 * @var yii\web\View $this
 * @var common\models\Group $model
 * @var common\models\Office $officeList
 * @var common\models\Profile $listProfile
 */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Groups'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$create = LabelHelper::getCreateButton('create');
?>

<ul class="nav nav-tabs" id="myTab" role="tablist">
    <li class="nav-item" role="presentation">
        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#group" role="tab"
           aria-controls="home" aria-selected="true"><?= Yii::t('app', 'Group'); ?></a>
    </li>
    <li class="nav-item" role="presentation">
        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#participant" role="tab"
           aria-controls="profile" aria-selected="false">
            <?= Yii::t('app', 'Participant'); ?>
            <span class="badge badge-primary"><?=count($listProfile);?></span>
        </a>
    </li>
</ul>

<div class="tab-content mt-3" id="myTabContent">
    <div class="tab-pane fade show active" id="group" role="tabpanel" aria-labelledby="home-tab">
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
//                [
//                    'attribute'=>'office_id',
//                    'value'=>($model->office_id!=null) ? $model->office->title:'',
//                    'type'=>DetailView::INPUT_SELECT2,
//                    'options' => ['id' => 'office_id', 'prompt' => '', 'disabled'=> (Yii::$app->user->identity->isAdmin) ? false : true],
//                    'items' => $officeList,
//                    'widgetOptions'=>[
//                        'class'=> Select2::class,
//                        'data'=>$officeList,
//                    ],
//                ],
                'title',
                'sequence',
                [
                    'attribute'=>'description',
                    'format'=>'html',
                    'type'=>DetailView::INPUT_TEXTAREA,
                ],

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
                            'value'=>($model->created_by!=null) ? User::getName($model->created_by):'',
                            'type'=>DetailView::INPUT_HIDDEN,
                            'valueColOptions'=>['style'=>'width:30%']
                        ],
                        [
                            'attribute'=>'updated_by',
                            'value'=>($model->updated_by!=null) ? User::getName($model->updated_by):'',
                            'type'=>DetailView::INPUT_HIDDEN,
                            'valueColOptions'=>['style'=>'width:30%']
                        ],
                    ],
                ],
            ],
            'deleteOptions' => [
                'url' => ['delete', 'id' => $model->id],
            ],
            'enableEditMode' => Yii::$app->user->can('update-group'),
        ]) ?>
    </div>
    <div class="tab-pane fade" id="participant" role="tabpanel" aria-labelledby="profile-tab">
        <?= $this->render('view_profile',[
                'model'=>$model,
                'listProfile' => $listProfile
        ]);?>
    </div>
</div>



