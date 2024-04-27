<?php

use common\helper\LabelHelper;
use yii\helpers\Html;
use yii\widgets\DetailView;
use kartik\grid\GridView;

/* @var $this yii\web\View */
/* @var $model common\models\Assessment */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Assessment'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="card">
    <div class="card-header">

        <?= Yii::t('app', 'Assessment') ?>
        <strong> #<?= $model->title; ?></strong>

        <div class="float-right">
            <?php
//            Html::a(
//                '<i class="fas fa-plus"></i> New',
//                ['create'],
//                ['class' => LabelHelper::getButtonCssPlus()]
//            );
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
                <h6 class="mb-3"><?= Yii::t('app', 'Office'); ?>:</h6>
                <div><strong><?= $model->office->title; ?></strong></div>
                <div><?= $model->office->address; ?></div>
                <div>Email: <?= $model->office->email; ?></div>
                <div>Phone: <?= $model->office->phone_number; ?></div>
            </div>

            <div class="col-sm-4">
                <h6 class="mb-3"><?= Yii::t('app', 'Details') ?>:</h6>
                <div>
                    <strong><?= $model->schedule->title; ?></strong>
                </div>
            </div>

            <div class="col-sm-4">
                <h6 class="mb-3"><?= Yii::t('app', 'Time') ?>:</h6>
                <div><?= Yii::t('app', 'Date Start'); ?> : <?= $model->date_start; ?></div>
                <div><?= Yii::t('app', 'Date End'); ?> : <?= $model->date_end; ?></div>
            </div>

        </div>

        <?php if ($providerAssessmentDetail->totalCount) { ?>

            <div class="table-responsive-sm">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th class="center">#</th>
                        <th><?= Yii::t('app', 'Participant'); ?></th>
                        <th><<?= Yii::t('app', 'Subject'); ?></th>
                        <th class="right"><?= Yii::t('app', 'Earned Points'); ?></th>
                        <th class="right"><?= Yii::t('app', 'Passing Score'); ?></th>
                        <th class="right"><?= Yii::t('app', 'Gained Score'); ?></th>
                        <th><?= Yii::t('app', 'Time Limit'); ?></th>
                        <th><?= Yii::t('app', 'Used Time'); ?></th>
                    </tr>
                    </thead>
                    <tbody>

                    <?php
                    $modelDetails = $providerAssessmentDetail->getModels();
                    foreach ($modelDetails as $i => $modelDetailItem) {
                        ?>
                        <tr>
                            <td class="center"><?= ($i + 1); ?></td>
                            <td class="left">
                                <?= $modelDetailItem->participant->title; ?>
                                <p><?= $modelDetailItem->quiz_title . ' (' . $modelDetailItem->quiz_type . ')'; ?></p>
                            </td>
                            <td class="left"><?= $modelDetailItem->subject->title; ?></td>
                            <td class="left"><?= $modelDetailItem->earned_points; ?></td>
                            <td class="left"><?= $modelDetailItem->passing_score; ?></td>
                            <td class="left"><?= $modelDetailItem->gained_score; ?></td>
                            <td class="left"><?= gmdate("H:i:s", $modelDetailItem->time_limit); ?></td>
                            <td class="left"><?= gmdate("H:i:s", $modelDetailItem->used_time); ?></td>
                        </tr>
                    <?php } ?>

                    </tbody>
                </table>
            </div>

        <?php } ?>


        <div class="row">
            <div class="col-lg-4 col-sm-5">
                <?= Yii::t('app', 'Created At'); ?>:
                <?= date(Yii::$app->params['dateDisplayFormat'], strtotime($model->created_at)); ?>
                <br><?= Yii::t('app', 'Created By'); ?> :
                <?= \common\models\User::getName($model->created_by); ?>
            </div>
            <div class="col-lg-4 col-sm-5 ml-auto">
                <?= Yii::t('app', 'Description'); ?>:
                <br><?= ($model->description == null) ? '-' : $model->description; ?>

            </div>
        </div>
    </div>
</div>
