<?php

use common\helper\LabelHelper;
use kartik\select2\Select2;
use kartik\detail\DetailView;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var common\models\Profile $model
 */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Profiles'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$create = LabelHelper::getCreateButton('create-regular');

?>
<div class="profile-view">

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
            'user_id',
            'office_id',
                [
                        'attribute' => 'group_id',
                        'value' => ($model->group_id != null) ? $model->group->title : '',
                        'type' => DetailView::INPUT_SELECT2,
                        'options' => ['id' => 'group_id', 'prompt' => '', 'disabled' => false],
                        'items' => $groupList,
                        'widgetOptions' => [
                                'class' => Select2::class,
                                'data' => $groupList,
                        ],
                ],
                [
                        'attribute' => 'user_type',
                        'format' => 'html',
                        'value' => ($model->user_type != null) ? $model->getOneUserType($model->user_type) : '',
                        'type' => DetailView::INPUT_SELECT2,
                        'options' => ['id' => 'user_type', 'prompt' => '', 'disabled' => false],
                        'items' => $userTypeList,
                        'widgetOptions' => [
                                'class' => Select2::class,
                                'data' => $userTypeList,
                        ],
                    //'valueColOptions'=>['style'=>'width:30%']
                ],
            'name',
            'password',
            'public_email:email',
            'gravatar_email:email',
            'gravatar_id',
            'location',
            'website',
            'timezone',
            'bio:ntext',
            'asset_name',
            [
                'attribute' => 'created_at',
                'format' => [
                    'datetime', (isset(Yii::$app->modules['datecontrol']['displaySettings']['datetime']))
                        ? Yii::$app->modules['datecontrol']['displaySettings']['datetime']
                        : 'd-m-Y H:i:s A'
                ],
                'type' => DetailView::INPUT_WIDGET,
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
                'type' => DetailView::INPUT_WIDGET,
                'widgetOptions' => [
                    'class' => DateControl::class,
                    'type' => DateControl::FORMAT_DATETIME
                ]
            ],
            'created_by',
            'updated_by',
            [
                'attribute' => 'deleted_at',
                'format' => [
                    'datetime', (isset(Yii::$app->modules['datecontrol']['displaySettings']['datetime']))
                        ? Yii::$app->modules['datecontrol']['displaySettings']['datetime']
                        : 'd-m-Y H:i:s A'
                ],
                'type' => DetailView::INPUT_WIDGET,
                'widgetOptions' => [
                    'class' => DateControl::class,
                    'type' => DateControl::FORMAT_DATETIME
                ]
            ],
            'deleted_by',
            'verlock',
            'uuid',
        ],
        'deleteOptions' => [
            'url' => ['delete', 'id' => $model->user_id],
        ],
        'enableEditMode' => true,
    ]) ?>

</div>
