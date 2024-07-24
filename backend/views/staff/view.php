<?php

use common\helper\UIHelper;
use yii\helpers\Html;
use kartik\detail\DetailView;
use kartik\widgets\Select2;

/**
 * @var yii\web\View $this
 * @var common\models\Staff $model
 */
$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Staff', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$create = UIHelper::getCreateButton();
?>


<div class="row">
    <div class="col-sm-3">
        <div class="card p-4">
            <div class=" image d-flex flex-column justify-content-center align-items-center">
                <button class="btn btn-secondary">
                    <img src="<?= $model->getAssetUrl() ?>" height="100" width="100" />
                </button>
                <span class="name mt-3"><?= $model->title; ?></span>

                <span class="idd">@<?= $model->email; ?></span>
            </div>

            <br>
            <div class="col text-center">
                <?= Html::a('Upload', ['/staff/update','id'=>$model->id,'title'=>$model->title], ['class'=>'btn btn-sm btn-primary']) ?>
            </div>

            <div class=" px-2 rounded mt-4 date">
                <span class="join justify-content-center align-items-center">Joined <br>
                    <?= Yii::$app->formatter->format($model->created_at, 'date'); ?>
                </span>
            </div>
        </div>
    </div>

    <div class="col-sm-9">
        <?=
        DetailView::widget([
            'model' => $model,
            'condensed' => false,
            'hover' => true,
            'mode' => Yii::$app->request->get('edit') == 't' ? DetailView::MODE_EDIT : DetailView::MODE_VIEW,
            'panel' => [
                'heading' => $this->title . $create,
                'type' => UIHelper::getDetailViewType(),
            ],
            'attributes' => [
                [
                    'columns' => [
                        [
                            'attribute' => 'title',
                            'valueColOptions'=>['style'=>'width:30%']
                        ],
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
                    ],
                ],



                [
                    'group' => true,
                    'rowOptions' => ['class' => 'default']
                ],
                [
                    'columns' => [
                        [
                            'attribute' => 'employment_id',
                            'value' => ($model->employment_id != null) ? $model->employment->title : '',
                            'type' => DetailView::INPUT_SELECT2,
                            'options' => ['id' => 'employment_id', 'prompt' => '', 'disabled' => false],
                            'items' => $employmentList,
                            'widgetOptions' => [
                                'class' => Select2::class,
                                'data' => $employmentList,
                            ],
                            'valueColOptions' => ['style' => 'width:30%']
                        ],
                        [
                            'attribute' => 'active_status',
                            'value' => ($model->active_status != null) ? $model->getOneActiveStatus($model->active_status) : '',
                            'format' => 'html',
                            'type' => DetailView::INPUT_SELECT2,
                            'options' => ['id' => 'active_status', 'prompt' => '', 'disabled' => false],
                            'items' => $activeStatusList,
                            'widgetOptions' => [
                                'class' => Select2::class,
                                'data' => $activeStatusList,
                            ],
                            'valueColOptions' => ['style' => 'width:30%']
                        ],
                    ],
                ],
                [
                    'columns' => [
                        [
                            'attribute' => 'phone_number',
                            'valueColOptions' => ['style' => 'width:30%']
                        ],
                        [
                            'attribute' => 'gender_status',
                            'value' => ($model->gender_status != null) ? $model->getOneGenderStatus($model->gender_status) : '',
                            'format' => 'html',
                            'type' => DetailView::INPUT_SELECT2,
                            'options' => ['id' => 'gender_status', 'prompt' => '', 'disabled' => false],
                            'items' => $genderList,
                            'widgetOptions' => [
                                'class' => Select2::class,
                                'data' => $genderList,
                            ],
                            'valueColOptions' => ['style' => 'width:30%']
                        ],
                    ],
                ],
                [
                    'columns' => [
                        [
                            'attribute' => 'initial',
                            'valueColOptions' => ['style' => 'width:30%']
                        ],
                        [
                            'attribute' => 'email',
                            'valueColOptions' => ['style' => 'width:30%']
                        ],
                    ],
                ],

                [
                    'group' => true,
                    'rowOptions' => ['class' => 'default']
                ],
                [
                    'attribute' => 'address',
                    'format' => 'html',
                    'type' => DetailView::INPUT_TEXTAREA,
                    //'valueColOptions'=>['style'=>'width:30%']
                ],
                [
                    'attribute' => 'description',
                    'format' => 'html',
                    'type' => DetailView::INPUT_TEXTAREA,
                    //'valueColOptions'=>['style'=>'width:30%']
                ],
                [
                    'attribute' => 'asset_name',
                    'type' => DetailView::INPUT_HIDDEN,
                ],
                [
                    'group' => true,
                    'rowOptions' => ['class' => 'default']
                ],
                [
                    'columns' => [
                        [
                            'attribute' => 'created_at',
                            'format' => 'date',
                            'type' => DetailView::INPUT_HIDDEN,
                            'valueColOptions' => ['style' => 'width:30%']
                        ],
                        [
                            'attribute' => 'updated_at',
                            'format' => 'date',
                            'type' => DetailView::INPUT_HIDDEN,
                            'valueColOptions' => ['style' => 'width:30%']
                        ],
                    ],
                ],
                [
                    'columns' => [
                        [
                            'attribute' => 'created_by',
                            'value' => ($model->created_by != null) ? \common\models\User::getName($model->created_by) : '',
                            'type' => DetailView::INPUT_HIDDEN,
                            'valueColOptions' => ['style' => 'width:30%']
                        ],
                        [
                            'attribute' => 'updated_by',
                            'value' => ($model->updated_by != null) ? \common\models\User::getName($model->updated_by) : '',
                            'type' => DetailView::INPUT_HIDDEN,
                            'valueColOptions' => ['style' => 'width:30%']
                        ],
                    ],
                ],
            ],
            'deleteOptions' => [
                'url' => ['delete', 'id' => $model->id],
            ],
            'enableEditMode' => Yii::$app->user->can('update-staff'),
        ])
        ?>
    </div>
</div>





