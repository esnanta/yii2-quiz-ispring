<?php

/* @var $this yii\web\View */
/* @var $searchModel common\models\GroupSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

use yii\helpers\Html;
use kartik\export\ExportMenu;
use kartik\grid\GridView;

$this->title = Yii::t('app', 'Choose Data Archive');
$this->params['breadcrumbs'][] = $this->title;

?>
<div class="group-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?php
    $gridColumn = [
        ['class' => 'yii\grid\SerialColumn'],
        ['attribute' => 'id', 'visible' => false],
        [
            'attribute' => 'office_id',
            'label' => Yii::t('app', 'Office'),
            'value' => function ($model) {
                if ($model->office) {
                    return $model->office->title;
                } else {
                    return null;
                }
            },
            'filterType' => GridView::FILTER_SELECT2,
            'filter' => $officeList,
            'filterWidgetOptions' => [
                'pluginOptions' => ['allowClear' => true],
            ],
            'filterInputOptions' => [
                    'placeholder' => Yii::t('app', 'Office'),
                    'id' => 'grid-group-search-office_id']
        ],
        'title',
        'description',
        [
            'format'=>'html',
            'vAlign'=>'middle',
            'width'=>'180px',
            'label' => Yii::t('app', 'Select'),
            'value' => function ($model) {
                if ($model->id) {
                    $button = Html::a(
                        '<i class="fas fa-plus"></i> '.Yii::t('app', 'Proceed'),
                        ['import','id'=>$model->id],
                        ['class' => 'btn btn-sm btn-info pull-right']
                    );
                    return $button;
                } else {
                    return null;
                }
            },
        ],
        
    ];
    ?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => $gridColumn,
        'pjax' => true,
        'pjaxSettings' => ['options' => ['id' => 'kv-pjax-container-group']],
        'panel' => [
            'type' => GridView::TYPE_DEFAULT,
            'heading' => '<h3 class="panel-title"><i class="glyphicon glyphicon-th-list"></i>  ' . Html::encode($this->title).' </h3>',
        ],
        // your toolbar can include the additional full export menu
        'toolbar' => [
            [
                'content'=>
                    Html::a('<i class="fas fa-plus"></i> Add Import', ['archive/create'], ['class' => 'btn btn-success']),
                   //. ' '.
                    //Html::a('<i class="fas fa-redo"></i> Reset List', ['index'], ['class' => 'btn btn-info']),
                'options' => ['class' => 'btn-group-md']
            ],
        ],
        
        'responsive' => true,
        'hover' => true,
        'condensed' => true,
        'floatHeader' => false,

        'bordered' => true,
        'striped' => false,
        'responsiveWrap' => false,
        
        
    ]); ?>
</div>
