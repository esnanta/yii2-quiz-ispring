<?php

use aneeshikmat\yii2\Yii2TimerCountDown\Yii2TimerCountDown;
use common\helper\LabelHelper;
use common\models\User;
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Schedule */
/* @var $providerAssessment yii\data\ActiveDataProvider */
/* @var $providerScheduleDetail yii\data\ActiveDataProvider */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Schedule'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$create = LabelHelper::getCreateButton();

$refresh = Html::a(
    '<i class="fas fa-sync-alt"></i> Refresh',
    ['view', 'id' => $model->id, 'title' => $model->title],
    ['class' => 'btn btn-sm btn-primary float-right float-end']
);

$labelAlertTimer = 'badge bg-warning text-white';
if ($interval < $minutesTolerance) :
    $labelAlertTimer = 'badge bg-success text-white';
endif;

Yii2TimerCountDown::widget([
    'countDownIdSelector' => 'time-down-counter-token',
    'countDownDate' => $countdownTime * 1000
]);
?>

<ul class="nav nav-tabs" id="myTab" role="tablist">
    <li class="nav-item" role="presentation">
        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#schedule" role="tab"
           aria-controls="home" aria-selected="true"><?= Yii::t('app', 'Schedule'); ?></a>
    </li>
    <li class="nav-item" role="presentation">
        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#token" role="tab"
           aria-controls="profile" aria-selected="false"><?= Yii::t('app', 'Token'); ?></a>
    </li>
</ul>

<div class="tab-content mt-3" id="myTabContent">
    <div class="tab-pane fade show active" id="schedule" role="tabpanel" aria-labelledby="home-tab">
        <div class="card">
            <div class="card-header">

                <?= Yii::t('app', 'Schedule') ?>
                <strong> #<?= $model->title; ?></strong>
                <div class="float-right">
                    <?=
                    Html::a(
                        '<i class="fas fa-plus"></i> New',
                        ['create'],
                        ['class' => LabelHelper::getButtonCssPlus()]
                    );
                    ?>
                    <?=
                    Html::a(
                        '<i class="fas fa-pencil-alt"></i> Update',
                        ['update', 'id' => $model->id],
                        ['class' => LabelHelper::getButtonCssUpdate()]
                    );
                    ?>
                    <?=
                    Html::a('<i class="fas fa-minus"></i> Delete', ['delete', 'id' => $model->id], [
                        'class' => LabelHelper::getButtonCssMinus(),
                        'data' => [
                            'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                            'method' => 'post',
                        ],
                    ]);
                    ?>
                    <button class="<?= LabelHelper::getButtonCssPrint() ?>" type="button" onclick="window.print();">
                        <i class="fas fa-print"></i>
                        Print
                    </button>
                </div>
            </div>

            <div class="card-body">
                <div class="row mb-4">

                    <div class="col-sm-4">
                        <div>
                            <strong><?= $model->title; ?> - <?= $model->getOneExamType($model->exam_type); ?> </strong>
                        </div>
                        <div><?= $model->period->title; ?></div>
                        <div><?= $model->group->title; ?></div>
                    </div>
                    <div class="col-sm-4">
                        <div><strong><?= Yii::t('app', 'Description'); ?></strong></div>
                        <div><?= ($model->description == null) ? '-' : $model->description; ?></div>
                    </div>
                    <div class="col-sm-4">
                        <div>
                            <strong><?= $model->room->title; ?></strong>
                        </div>
                        <div><?= Yii::t('app', 'Date Start'); ?> : <?= $model->date_start; ?></div>
                        <div><?= Yii::t('app', 'Date End'); ?> : <?= $model->date_end; ?></div>
                    </div>

                </div>

                <?php if ($providerScheduleDetail->totalCount) { ?>

                    <div class="table-responsive-sm">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th class="center">#</th>
                                <th><?= Yii::t('app', 'Subject'); ?></th>
                                <th><?= Yii::t('app', 'Remark'); ?></th>
                                <th><?= Yii::t('app', 'Subject Type'); ?></th>
                                <th class="center"><?= Yii::t('app', 'Asset'); ?></th>
                                <th class="right"><?= Yii::t('app', ''); ?></th>
                            </tr>
                            </thead>
                            <tbody>

                            <?php
                            $modelDetails = $providerScheduleDetail->getModels();
                            foreach ($modelDetails as $i => $modelDetailItem) {
                                ?>

                                <tr>
                                    <td class="center"><?= ($i + 1); ?></td>
                                    <td class="left"><?= $modelDetailItem->subject->title; ?></td>
                                    <td class="left"><?= $modelDetailItem->remark; ?></td>
                                    <td class="left"><?= $modelDetailItem->getOneQuestionType($modelDetailItem->question_type); ?></td>
                                    <td class="center">
                                        <?php
                                        if (empty($modelDetailItem->asset_name)) {
                                            echo Yii::t('app', 'Please upload files in zip');
                                        } else {
                                            echo $modelDetailItem->getAssetButton(0);
                                        }
                                        ?></td>
                                    <td class="right">
                                        <?php
                                        if ($modelDetailItem->asset_name == null) {
                                            echo Html::a(
                                                '<i class="fas fa-upload"></i>',
                                                ['schedule-detail/update', 'id' => $modelDetailItem->id],
                                                ['class' => LabelHelper::getButtonCssPlus()]
                                            );
                                        } else {
                                            echo Html::a('<i class="fas fa-trash-alt"></i>',
                                                ['schedule-detail/delete-file', 'id' => $modelDetailItem->id], [
                                                    'class' => LabelHelper::getButtonCssMinus(),
                                                    'data' => [
                                                        'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                                                        'method' => 'post',
                                                    ],
                                                ]);
                                        }
                                        ?>
                                    </td>
                                </tr>

                            <?php } ?>

                            </tbody>
                        </table>
                    </div>

                <?php } ?>

                <ul class="nav nav-tabs">
                    <!--            <li class="nav-item">-->
                    <!--                <a class="nav-link active" data-toggle="tab" href="#summary">Summary</a>-->
                    <!--            </li>-->
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#detail">Detail</a>
                    </li>
                </ul>

                <div class="tab-content">
                    <!--            <div class="tab-pane fade show active" id="summary">-->
                    <!--                <p>This is the Home content.</p>-->
                    <!--            </div>-->
                    <div class="tab-pane fade show active" id="detail">
                        <?php if ($providerAssessment->totalCount) {
                            echo $this->render('view_assessment', [
                                'providerAssessment' => $providerAssessment,
                            ]);
                        }
                        ?>
                    </div>
                </div>

                <br>

                <div class="row">
                    <div class="col-lg-4 col-sm-5">
                        <?= Yii::t('app', 'Created At'); ?>:
                        <?= date(Yii::$app->params['dateDisplayFormat'], strtotime($model->created_at)); ?>
                        <br><?= Yii::t('app', 'Created By'); ?> :
                        <?= User::getName($model->created_by); ?>
                    </div>
                    <div class="col-lg-4 col-sm-5 ml-auto">
                        <?= '( ' . $model->staff->title . ' )'; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="tab-pane fade" id="token" role="tabpanel" aria-labelledby="profile-tab">
        <div class="card mb-3">
            <div class="card-body">
                <table class="table table-borderless">
                    <tbody>
                    <tr>
                        <th>Token :</th>
                        <td><strong><?= $model->token; ?></strong></td>
                        <td>
                            <strong>
                                <div class="<?= $labelAlertTimer; ?>">
                                    <div id="time-down-counter-token"></div>
                                </div>
                            </strong>
                        </td>
                        <td> <?= $tokenMessage?> </td>
                        <td> <?= $refresh; ?> </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>