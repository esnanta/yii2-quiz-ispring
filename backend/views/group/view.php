<?php

use common\helper\IconHelper;
use common\helper\LabelHelper;
use common\models\User;
use kartik\detail\DetailView;
use kartik\widgets\Select2;
use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Group $model
 * @var common\models\Office $officeList
 * @var common\models\Participant $listParticipant
 */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Groups'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$create = LabelHelper::getCreateButton('');
?>

<ul class="nav nav-tabs" id="myTab" role="tablist">
    <li class="nav-item" role="presentation">
        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#group" role="tab"
           aria-controls="home" aria-selected="true"><?= Yii::t('app', 'Group'); ?></a>
    </li>
    <li class="nav-item" role="presentation">
        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#participant" role="tab"
           aria-controls="profile" aria-selected="false"><?= Yii::t('app', 'Participant'); ?></a>
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
        <div class="card border-default mb-3">
            <div class="card-header">
                <?=Yii::t('app', 'Participants');?>
                <span class="float-right float-end">
                    <?= Html::a(IconHelper::getUpdate(),
                        ['update-participant', 'id'=>$model->id, 'title'=>$model->title],
                        ['class' => 'btn btn-primary float-right float-end']); ?>
                </span>
            </div>
            <div class="card-body text-default">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col"><?=Yii::t('app', 'Title');?></th>
                        <th scope="col"><?=Yii::t('app', 'Identity Number');?></th>
                        <th scope="col"><?=Yii::t('app', 'Username');?></th>
                        <th scope="col"><?=Yii::t('app', 'Group');?></th>
                    </tr>
                    </thead>
                    <tbody>

                    <?php
                        foreach ($listParticipant as $i=>$participant) {
                    ?>
                            <tr>
                                <th scope="row"><?=($i+1)?></th>
                                <td><?= $participant->title ?></td>
                                <td><?= $participant->identity_number ;?></td>
                                <td><?= $participant->username ;?></td>
                                <td><?= $participant->group->title ;?></td>
                            </tr>
                    <?php } ?>


                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>



