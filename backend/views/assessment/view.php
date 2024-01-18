<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use kartik\grid\GridView;

/* @var $this yii\web\View */
/* @var $model backend\models\Assessment */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Assessment'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="assessment-view">

    <div class="row">
        <div class="col-sm-9">
            <h2><?= Yii::t('app', 'Assessment').' '. Html::encode($this->title) ?></h2>
        </div>
        <div class="col-sm-3" style="margin-top: 15px">
            
            <?= Html::a(Yii::t('app', 'Update'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
            <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->id], [
                'class' => 'btn btn-danger',
                'data' => [
                    'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                    'method' => 'post',
                ],
            ])
            ?>
        </div>
    </div>

    <div class="row">
<?php 
    $gridColumn = [
        ['attribute' => 'id', 'visible' => false],
        [
            'attribute' => 'office.title',
            'label' => Yii::t('app', 'Office'),
        ],
        'title',
        [
            'attribute' => 'subject.title',
            'label' => Yii::t('app', 'Subject'),
        ],
        [
            'attribute' => 'room.title',
            'label' => Yii::t('app', 'Room'),
        ],
        'date_start',
        'date_end',
        'description:ntext',
        'is_deleted',
        ['attribute' => 'verlock', 'visible' => false],
        'uuid',
    ];
    echo DetailView::widget([
        'model' => $model,
        'attributes' => $gridColumn
    ]);
?>
    </div>
    <div class="row">
        <h4>Office<?= ' '. Html::encode($this->title) ?></h4>
    </div>
    <?php 
    $gridColumnOffice = [
        ['attribute' => 'id', 'visible' => false],
        'user_id',
        'unique_id',
        'title',
        'phone_number',
        'fax_number',
        'email',
        'web',
        'address',
        'latitude',
        'longitude',
        'facebook',
        'google_plus',
        'instagram',
        'twitter',
        'description:ntext',
        'is_deleted',
        ['attribute' => 'verlock', 'visible' => false],
        'uuid',
    ];
    echo DetailView::widget([
        'model' => $model->office,
        'attributes' => $gridColumnOffice    ]);
    ?>
    <div class="row">
        <h4>Room<?= ' '. Html::encode($this->title) ?></h4>
    </div>
    <?php 
    $gridColumnRoom = [
        ['attribute' => 'id', 'visible' => false],
        [
            'attribute' => 'office.title',
            'label' => Yii::t('app', 'Office'),
        ],
        'title',
        'sequence',
        'description:ntext',
        'is_deleted',
        ['attribute' => 'verlock', 'visible' => false],
        'uuid',
    ];
    echo DetailView::widget([
        'model' => $model->room,
        'attributes' => $gridColumnRoom    ]);
    ?>
    <div class="row">
        <h4>Subject<?= ' '. Html::encode($this->title) ?></h4>
    </div>
    <?php 
    $gridColumnSubject = [
        ['attribute' => 'id', 'visible' => false],
        [
            'attribute' => 'office.title',
            'label' => Yii::t('app', 'Office'),
        ],
        'title',
        'sequence',
        'description:ntext',
        'is_deleted',
        ['attribute' => 'verlock', 'visible' => false],
        'uuid',
    ];
    echo DetailView::widget([
        'model' => $model->subject,
        'attributes' => $gridColumnSubject    ]);
    ?>
    
    <div class="row">
<?php
if($providerAssessmentDetail->totalCount){
    $gridColumnAssessmentDetail = [
        ['class' => 'yii\grid\SerialColumn'],
            ['attribute' => 'id', 'visible' => false],
            [
                'attribute' => 'office.title',
                'label' => Yii::t('app', 'Office')
            ],
                        [
                'attribute' => 'participant.title',
                'label' => Yii::t('app', 'Participant')
            ],
            'app_version',
            'earned_points',
            'passing_score',
            'passing_score_percent',
            'gained_score',
            'quiz_title',
            'quiz_type',
            'username',
            'time_limit:datetime',
            'used_time:datetime',
            'time_spent:datetime',
            'is_deleted',
            ['attribute' => 'verlock', 'visible' => false],
            'uuid',
    ];
    echo Gridview::widget([
        'dataProvider' => $providerAssessmentDetail,
        'pjax' => true,
        'pjaxSettings' => ['options' => ['id' => 'kv-pjax-container-tx-assessment-detail']],
        'panel' => [
            'type' => GridView::TYPE_PRIMARY,
            'heading' => '<span class="glyphicon glyphicon-book"></span> ' . Html::encode(Yii::t('app', 'Assessment Detail')),
        ],
        'export' => false,
        'columns' => $gridColumnAssessmentDetail
    ]);
}
?>

    </div>
</div>
