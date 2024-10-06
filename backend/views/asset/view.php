<?php

use common\helper\IconHelper;
use common\helper\LabelHelper;
use common\models\Asset;
use lesha724\documentviewer\ViewerJsDocumentViewer;
use yii\helpers\Html;
use kartik\detail\DetailView;
use kartik\datecontrol\DateControl;
use kartik\widgets\FileInput;
use kartik\select2\Select2;

/**
 * @var yii\web\View $this
 * @var common\models\Asset $model
 * @var common\models\Asset $assetCategoryList
 * @var common\models\Asset $assetTypeList
 * @var common\models\Asset $isVisibleList
 * @var common\service\AssetService $assetUrl
 * @var common\helper\SpreadsheetHelper $helper
 * @var common\helper\SpreadsheetHelper $fileData
 * @var string $fileType
 */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Assets'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;

$create = LabelHelper::getCreateButton();

$deleteAsset = Html::a('<i class="fa fa-trash"></i> Delete File', ['asset/delete-file', 'id' => $model->id],
    ['class' => 'float-right', 'data-confirm' => "Delete Asset?",
        'data-method' => 'POST', 'title' => 'Delete Asset?']);
?>

<div class="asset-view">
    <div class="row">
        <div class="col-md-5">

            <?= $this->render('_view_side', [
                'model' => $model,
                'scheduleDetailList'=>$scheduleDetailList,
                'assetUrl' => $assetUrl,
                'fileType' => $fileType,
                'helper' => $helper,
                'fileData' => $fileData,
                'renderIndexFileStatus' => $renderIndexFileStatus
            ]) ?>

        </div>

        <div class="col-md-7">
            <?= DetailView::widget([
                'model' => $model,
                'condensed' => false,
                'hover' => true,
                'mode' => Yii::$app->request->get('edit') == 't' ? DetailView::MODE_EDIT : DetailView::MODE_VIEW,
                'panel' => [
                    'heading' => $this->title,
                    'type' => DetailView::TYPE_DEFAULT,
                ],
                'attributes' => [
                    [
                        'attribute' => 'date_issued',
                        'format' => 'date',
                        'type' => DetailView::INPUT_WIDGET,
                        'widgetOptions' => [
                            'class' => DateControl::class,
                            'type' => DateControl::FORMAT_DATE,
                        ],
                    ],
                    [
                        'attribute' => 'title',
                        'format' => 'html',
                        'type' => DetailView::INPUT_TEXT,
                    ],
                    [
                        'attribute' => 'asset_category_id',
                        'value' => ($model->asset_category_id != null) ? $model->assetCategory->title : '',
                        'type' => DetailView::INPUT_SELECT2,
                        'options' => ['id' => 'asset_category_id', 'prompt' => '', 'disabled' => false],
                        'items' => $assetCategoryList,
                        'widgetOptions' => [
                            'class' => Select2::class,
                            'data' => $assetCategoryList,
                        ],
                    ],
                    [
                        'attribute' => 'asset_type',
                        'format' => 'html',
                        'value' => ($model->asset_type != null) ? $model->getOneAssetType($model->asset_type) : '',
                        'type' => DetailView::INPUT_SELECT2,
                        'options' => ['id' => 'asset_type', 'prompt' => '', 'disabled' => false],
                        'items' => $assetTypeList,
                        'widgetOptions' => [
                            'class' => Select2::class,
                            'data' => $assetTypeList,
                        ],
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute' => 'is_visible',
                        'format' => 'html',
                        'value' => ($model->is_visible != null) ? $model->getOneIsVisible($model->is_visible) : '',
                        'type' => DetailView::INPUT_SELECT2,
                        'options' => ['id' => 'is_visible', 'prompt' => '', 'disabled' => false],
                        'items' => $isVisibleList,
                        'widgetOptions' => [
                            'class' => Select2::class,
                            'data' => $isVisibleList,
                        ],
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute' => 'description',
                        'format' => 'html',
                        'value' => $model->description,
                        'type' => DetailView::INPUT_TEXTAREA,
                    ],

                    [
                        'attribute' => 'asset',
                        'label' => 'Asset Url',
                        'value' => 'https://' . Yii::$app->getRequest()->serverName . $assetUrl,
                        'format' => 'raw',

                        'type' => DetailView::INPUT_WIDGET,
                        'widgetOptions' => [
                            'class' => FileInput::class,
                            'pluginOptions' => ['previewFileType' => 'any', 'showUpload' => false,]
                        ],
                        //'valueColOptions'=>['style'=>'width:30%']
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
                'enableEditMode' => Yii::$app->user->can('update-asset'),
            ]) ?>
        </div>
    </div>

</div>
