<?php

use aneeshikmat\yii2\Yii2TimerCountDown\Yii2TimerCountDown;
use common\helper\DateHelper;
use common\helper\IconHelper;
use common\helper\LabelHelper;
use common\models\User;
use common\service\ScheduleDetailService;
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Schedule */
/* @var $scheduleDetailService common\service\ScheduleDetailService */
/* @var $providerAssessment yii\data\ActiveDataProvider */
/* @var $providerScheduleDetail yii\data\ActiveDataProvider */



$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Schedule'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$create = LabelHelper::getCreateButton();

?>

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
                <div>
                    <?= Yii::t('app', 'Date Start'); ?> :
                    <?= DateHelper::formatDateTime($model->date_start); ?>
                </div>
                <div>
                    <?= Yii::t('app', 'Date End'); ?> :
                    <?= DateHelper::formatDateTime($model->date_end); ?>
                </div>
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
                        <th><?= Yii::t('app', 'Question Type'); ?></th>
                        <th class="center"><?= Yii::t('app', 'Asset'); ?></th>
                    </tr>
                    </thead>
                    <tbody>

                    <?php
                    $modelDetails = $providerScheduleDetail->getModels();
                    foreach ($modelDetails as $i => $modelDetailItem) {
                        $submissionIsFalse = false;
                        ?>

                        <tr>
                            <td class="center"><?= ($i + 1); ?></td>
                            <td class="left"><?= $modelDetailItem->subject->title; ?></td>
                            <td class="left"><?= $modelDetailItem->remark; ?></td>
                            <td class="left"><?= $modelDetailItem->getOneQuestionType($modelDetailItem->question_type); ?></td>
                            <td class="center">
                                <?php
                                if (empty($modelDetailItem->asset_id)) {
                                    echo Yii::t('app', 'Please upload files in zip');
                                } else {
                                    echo $scheduleDetailService->getAssetButton(
                                            $modelDetailItem,
                                            $submissionIsFalse,0,
                                            ScheduleDetailService::EXECUTE_ASSESSMENT_FALSE
                                    );
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
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#participant">
                    <?= Yii::t('app', 'Participant'); ?></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#assessment">
                    <?= Yii::t('app', 'Assessment'); ?>
                </a>
            </li>
        </ul>

        <div class="tab-content">
            <div class="tab-pane fade show active" id="participant">
                <?php if (!empty($participantList)) {
                    echo $this->render('view_participant', [
                            'model'=>$model,
                            'participantList' => $participantList,
                    ]);
                }
                ?>
            </div>
            <div class="tab-pane fade show" id="assessment">
                <?php if ($providerAssessment->totalCount) {

                    $deleteAllAssessment = Html::a(
                            IconHelper::getDelete().' Delete All',
                            ['/schedule/delete-assessment', 'id' => $model->id],
                            ['data-method' => 'post',
                                    'data-confirm' => 'Delete all assessment?',
                                    'class' => 'float-right float-end',
                                    'title' => 'Delete']);

                    echo '<br>';
                    echo $deleteAllAssessment;
                    echo '<br>';

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